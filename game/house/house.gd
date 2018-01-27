extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#

var active
var balloons
var timer

enum { BROKEN, SADFACE }

export (int) var hardness = 1
export (int) var base = 12

export(int) var initialOffset = 0
export(int) var offset  = 0 # space between balloons
export(int) var bonusTime = 0 # Time  gained when a balloon is delevery
export(int) var auraTime = 0	 # Time gained when house is cleared
export(int) var maxBalloons = 1 # Maximum of balloons possible
export(int) var houseId = 1

var cooldownMin = 0
var cooldownMax = 0
var initialTime = 0
var score = 0
var cooldown = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	active = true
	adjustHardness(hardness)
	calcCooldown()
	set_process(true)
	balloons = []
	pass

func _process(delta):
	if cooldown > OS.get_ticks_msec():
		spawnBalloon()
		set_process(false)

func spawnBalloon():
	active = true
	var nBalloons = (randi()%(maxBalloons )) +1
	var balloonType = randi()%2
	for i in range(0, nBalloons):
		var balloon = preload("res://balloon/balloon.tscn").instance()
		balloons.append(balloon)
		balloon.setType(balloonType)
		add_child(balloon)
		balloon.set_pos(Vector2(0, initialOffset))
	print("Spawnei - ", nBalloons)		
	pass

func receiveAura():
	if active:
		timer += auraTime
	pass

func sendAura():
	set_process(true)
	calcCooldown()
	# send aura to neighboors
	pass

func removeBalloon():
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
	cooldown += OS.get_ticks_msec()
	

