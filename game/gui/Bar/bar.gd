extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var width = 128
var height = 20

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("back").set_region_rect(Rect2(128,0,0, height))
	get_node("back").set_pos(Vector2(64,0))
	get_node("cat").frame = 0
	pass
	
func updateRage(rage):
	var newWidth = int(rage*width/100.0)
	get_node("back").set_region_rect(Rect2(128,0,newWidth, height))
	get_node("back").set_pos(Vector2(64 - newWidth/2,0))
	get_node("cat").frame = int(rage/20)
	pass
