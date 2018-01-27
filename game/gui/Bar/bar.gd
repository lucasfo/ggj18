extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(int) var width = 32
export(int) var height = 32

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("back").scale(Vector2(width, height))
	pass
	
func updateRage(rage):
	var newWidth = int((rage/100.0)*width)
	get_node("back").set_global_scale(Vector2(newWidth, height))
	pass
