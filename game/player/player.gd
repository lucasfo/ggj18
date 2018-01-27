extends KinematicBody2D

### anim
enum ANIM{idle=0, walkl, walkr}
var animId

### movement
export var playerSpeed = 500
var isHiding = false
var isHidingTime

### interactions
enum BALLOON{NONE,SADFACE, BROKEN}
var balloon = BALLOON.NONE
enum COLTYPE{NONE, HOUSE ,MAILBOX}
var colType = COLTYPE.NONE
var colInfo

### sceneBalloon
var sceneBalloon
var actualBalloon

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
		get_node("AnimationPlayer").play("Idle")
		move(Vector2(0,1)*50)
		return
		
	if(movement.x==1 and animId!=ANIM.walkr):
		get_node("AnimationPlayer").play("WalkR")
		animId=ANIM.walkr
	elif(movement.x==-1 and animId!=ANIM.walkl):
		get_node("AnimationPlayer").play("WalkL")
		animId=ANIM.walkl
	elif(movement.x==0 and animId!=ANIM.idle):
		get_node("AnimationPlayer").play("Idle")
		animId=ANIM.idle
		
	move(movement * playerSpeed * delta)
	### end MOVEMENT
	pass

func on_area_enter(area):
	if(area.houseId==0):
		colType = COLTYPE.MAILBOX
		#colInfo = area.ballon
	else:
		colType = COLTYPE.HOUSE
		#colInfo = Vector2(area.houseId, area.houseLeft)

func on_area_exit(area):
	colType=COLTYPE.NONE
	colInfo=-1

func _input(event):
	if event.is_action("interact"):
		if(balloon != BALLOON.NONE):
				actualBalloon.queue_free()
				balloon = BALLOON.NONE
		if(colType!=COLTYPE.NONE):
			if(colType==COLTYPE.MAILBOX):
				actualBalloon = sceneBalloon.instance()
				actualBalloon.set_pos(Vector2(0,48))
				self.add_child(actualBalloon)
				if(colInfo==0):
					balloon = BALLOON.BROKEN
				if(colInfo==1):
					balloon = BALLOON.SADFACE
			elif(colType==COLTYPE.HOUSE and balloon!=BALLOON.NONE):
				#check houseballon,ownballon
				pass