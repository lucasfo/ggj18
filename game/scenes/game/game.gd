extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#
#

export var leftHousesPath = [NodePath()]
export var rightHousesPath = [NodePath()]
export(int) var periodSpawn = 0

var lastSpawn
var leftHouses
var rightHouses

var score = 0
var rage = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	lastSpawn = OS.get_ticks_msec()
	leftHouses = []
	rightHouses = []
	for path in leftHousesPath:
		leftHouses.append(get_node(path))
	for path in rightHousesPath:
		rightHouses.append(get_node(path))
	
	var thisNode = get_node(".")
	thisNode.connect("house_end", self, "houseHandler")

	score = 0
	rage = 0
	pass

func houseHandler(houseId, houseLeft, houseScore, houseRage, time, remainingBalloons):
	if remainingBalloons > 0:
		rage += houseRage
		if rage >= 100:
			endGame()
	else:
		score += houseScore
		var houses
		if houseLeft:
			houses = leftHouses
		else:
			houses = rightHouses

		if houseId == 1:
			houses[2].receiveAura(time)
		elif houseId == 5:
			houses[4].receiveAura(time)
		else:
			houses[houseId -1].receiveAura(time)
			houses[houseId +1].receiveAura(time)
			
	pass

func endGame():
	print("endGame")
	pass
