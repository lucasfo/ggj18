extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#

var active
var player
var ballons
var timer

enum { HEARTH, SMILE }

export(int) var offset # space between ballons
export(NodePath) var playerPath #  playerPath
export(int) var initialTime # House initial timer
export(int) var bonusTime # Time  gained when a ballon is delevery
export(int) var auraTime # Time gained when house is cleared
export(int) var maxBallons # Maximum of ballons possible

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	active = false
	player = get_node(playerPath)
	ballons = []
	pass

func spawnBallon():
	var nBallons = (randi()%(maxBallons -1)) +1
	var ballonType = randi()%2
	for i in range(0, nBallons):
		ballons.append(preload("res://ballon/ballon.tscn").instance())
		ballons.back().setType(ballonType)
		
	pass

func receiveAura():
	if active:
		timer += auraTimer
	pass
func sendAura():
	pass

func removeBallon():
	ballons.pop_front()
	timer += bonusTime
	if ballons.size() == 0:
		active = false
		sendAura()
	pass

func receiveBallon(type):
	if ballons.size() > 0:
		if ballons.front().type == type
			removeBallon()
			return true
		else
			return false
	else
		return false
	pass
	


