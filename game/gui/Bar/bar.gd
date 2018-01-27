extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(int) var width
export(int) var height 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func updateRage(rage):
	get_node("back")width*(rage/100.0)
	pass
