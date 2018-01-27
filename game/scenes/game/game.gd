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
	pass
