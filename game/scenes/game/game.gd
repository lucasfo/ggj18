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
		var house = get_node(path)
		leftHouses.append(house)
		house.connect("house_end", self, "houseHandler")
	for path in rightHousesPath:
		var house = get_node(path)
		rightHouses.append(house)
		house.connect("house_end", self, "houseHandler")
	
	updateRage()

	score = 0
	rage = 0
	pass

func houseHandler(houseId, houseLeft, houseScore, houseRage, time, remainingBalloons):
	if remainingBalloons > 0:
		rage += houseRage
		updateRage()
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

func updateRage():
	get_node("bar").updateRage(rage)
