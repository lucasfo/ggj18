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
var hardness = 1

# Scoreboard
onready var scoreInfo = get_node("/root/scoreboardInfo")

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
	get_node("Player").connect("drop_balloon", self, "balloonHandler")
	
	updateRage()
	get_node("CanvasLayer/score").text = "Score:  0";

	score = 0
	rage = 0
	pass

func houseHandler(houseId, houseLeft, houseScore, houseRage, time, remainingBalloons):
	if remainingBalloons > 0:
		rage += houseRage
		print("ue")
		get_node("Sounds").play("thunder")
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
			if houses.size() > 1:
				houses[1].receiveAura(time)
		elif houseId == 2:
			houses[0].receiveAura(time)

		
		updateHardness()
		#Can lead to bugs and division by zero
		#with high hardness	
		get_node("CanvasLayer/score").set_text( "Score: " + str(score))
	pass

func balloonHandler(houseId, houseLeft, balloon):
	if houseId != 0:
		var house
		if houseLeft:
			house = leftHouses[houseId -1]
		else:
			house = rightHouses[houseId -1]
		house.receiveBalloon(balloon)
		

func endGame():
	scoreInfo.enterNewScore(score)
	get_tree().change_scene("res://scenes/dieScene.tscn")
	pass

func updateRage():
	get_node("CanvasLayer/bar").updateRage(rage)

func updateHardness():
	if score > 150/(hardness*hardness):
		hardness *= 0.9
		for house in leftHouses:
			house.adjustHardness(hardness)
		for house in rightHouses:
			house.adjustHardness(hardness)
