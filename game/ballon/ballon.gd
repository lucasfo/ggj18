extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#

enum {BROKEN, SADFACE, HEARTH, SMILE}
var type


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func setType(type):
	get_node(".").frame = type
