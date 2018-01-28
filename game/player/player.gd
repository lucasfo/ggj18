extends KinematicBody2D

### anim
enum ANIM{idle=0, walkl, walkr, hide}
var animId

### movement
export var playerSpeed = 500
var isHiding = false
var isHidingTime
var isLeft 

### interactions
enum BALLOON{NONE, BROKEN,SADFACE}
var balloon = BALLOON.NONE
enum COLTYPE{NONE, HOUSE ,MAILBOX}
var colType = COLTYPE.NONE
var colInfo

### sceneBalloon
var sceneBalloon
var actualBalloon

### house
var houseId = 0
var houseLeft = true

signal drop_balloon

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	get_node("Area2D").connect("area_enter",self,"on_area_enter")
	get_node("Area2D").connect("area_exit",self,"on_area_exit")
	sceneBalloon = preload("res://balloon/balloon.tscn")
	pass

func _fixed_process(delta):
	
	### begin MOVEMENT
	if( isHiding and OS.get_ticks_msec() - isHidingTime>800):
		isHiding=false
		move(Vector2(0,-1)*50)
	elif (isHiding):
		return
	
	var movement = Vector2(0,0)
	if( Input.is_action_pressed("ui_right")):
		movement.x += 1
	if( Input.is_action_pressed("ui_left")):
		movement.x += -1
	if( Input.is_action_pressed("ui_down") and !isHiding):
		isHidingTime = OS.get_ticks_msec()
		isHiding=true
		get_node("AnimationPlayer").play("Hide")
		animId=ANIM.hide
		move(Vector2(0,1)*50)
		return
		
	if(movement.x==1 and animId!=ANIM.walkr):
		get_node("AnimationPlayer").play("WalkR")
		isLeft=false
		animId=ANIM.walkr
	elif(movement.x==-1 and animId!=ANIM.walkl):
		get_node("AnimationPlayer").play("WalkL")
		animId=ANIM.walkl
		isLeft=true
	elif(movement.x==0 and animId!=ANIM.idle):
		get_node("AnimationPlayer").play("Idle")
		animId=ANIM.idle
		
	if(balloon != BALLOON.NONE):
		actualBalloon.setPlayerTypeSide((balloon-1)*2,isLeft)
		if balloon == BALLOON.BROKEN:
			actualBalloon.setPlayerTypeSide(2,isLeft)
		else:
			actualBalloon.setPlayerTypeSide(0,isLeft)
	var pos = get_node(".").get_pos()
	if pos.x > 730:
		get_node(".").set_pos(Vector2(729, pos.y))
	if pos.x < -180:
		get_node(".").set_pos(Vector2(-179, pos.y))
	move(movement * playerSpeed * delta)
	### end MOVEMENT
	pass

func on_area_enter(area):
	if(area.houseId == 0):
		colType = COLTYPE.MAILBOX
		colInfo = area.balloon
	else:
		colType = COLTYPE.HOUSE
		#colInfo = Vector2(area.houseId, area.houseLeft)
		houseId = area.houseId
		houseLeft = area.houseLeft

func on_area_exit(area):
	colType=COLTYPE.NONE
	colInfo=-1
	houseId = 0
	houseLeft = true

func _input(event):
	if event.is_action_pressed("interact"):
		if(colType!=COLTYPE.NONE):
			if(colType==COLTYPE.MAILBOX):
				actualBalloon = sceneBalloon.instance()
				actualBalloon.set_pos(Vector2(0,-40))
				actualBalloon.setPlayerTypeSide(colInfo,isLeft)
				self.add_child(actualBalloon)
				if colInfo == 2:
					balloon = BALLOON.BROKEN
				else:
					balloon = BALLOON.SADFACE

			elif(colType==COLTYPE.HOUSE and balloon!=BALLOON.NONE):
				#check houseballon,ownballon
				if balloon == BALLOON.SADFACE:
					emit_signal("drop_balloon", houseId, houseLeft, 0)
				elif balloon == BALLOON.BROKEN:
					emit_signal("drop_balloon", houseId, houseLeft, 2)
				actualBalloon.queue_free()
				balloon = BALLOON.NONE
		elif(balloon != BALLOON.NONE):
			actualBalloon.queue_free()
			balloon = BALLOON.NONE
