extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#

var active
var balloons
var timer

enum { SADFACE, SMILE, BROKEN, HEARTH }

export (int) var hardness = 1
export (int) var base = 12

export(int) var initialOffset = 0
export(int) var offset  = 0 # space between balloons
export(int) var bonusTime = 0 # Time  gained when a balloon is delevery
export(int) var maxBalloons = 1 # Maximum of balloons possible
export(int) var houseId = 1
export(int) var houseLeft = true

var cooldownMin = 0
var cooldownMax = 0
var initialTime = 0
var score = 0
var cooldown = 0
var baseBalloons

signal house_end

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	active = false
	adjustHardness(hardness)
	calcCooldown()
	set_process(true)
	balloons = []
	timer = initialTime* 1000
	pass

func _process(delta):
	var ticks =  OS.get_ticks_msec()
	if cooldown < ticks && not active:
		active = true
		spawnBalloon()
	if active && timer < ticks:
		active = false
		sendAura()
		

func spawnBalloon():
	print("SPaw balao")
	active = true
	var nBalloons = (randi()%(maxBalloons )) +1
	for i in range(0, nBalloons):
		var balloonType = randi()%2
		if balloonType == 0:
			balloonType = HEARTH
		else:
			balloonType = SMILE
		var balloon = preload("res://balloon/balloon.tscn").instance()
		balloons.append(balloon)
		balloon.setType(balloonType)
		add_child(balloon)
		balloon.set_pos(Vector2(0, initialOffset))
	baseBalloons = nBalloons
	timer = OS.get_ticks_msec() + initialTime*1000		
	pass

func receiveAura(auraTime):
	if active:
		timer += auraTime
	pass

func sendAura():
	print("Morre balao")
	calcCooldown()
	for balloon in balloons:
		remove_child(balloon)
		balloon.queue_free()
	var score = (baseBalloons * hardness) + int(timer)
	var rage = balloons.size() * 5
	emit_signal("house_end", houseId, houseLeft, score, rage, int(timer), balloons.size())
	# send aura to neighboors
	pass

func removeBalloon():
	var balloon = balloons.front()
	remove_child(balloon)
	balloon.queue_free()
	balloons.pop_front()
	timer += bonusTime
	if balloons.size() == 0:
		active = false
		sendAura()
	pass

func receiveBalloon(type):
	if balloons.size() > 0:
		if balloons.front().type == type:
			removeBalloon()
			return true
		else:
			return false
	else:
		return false
	pass
	
func adjustHardness(hard):
	hardness = hard
	initialTime = houseId*base - hardness
	cooldownMin = initialTime - hardness
	cooldownMax = int(cooldownMin * 1.5)

func calcCooldown():
	cooldown = (randi()%(cooldownMax - cooldownMin)) + cooldownMin
	cooldown *= 1000
	cooldown += OS.get_ticks_msec()
	

