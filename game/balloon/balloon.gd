extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum {BROKEN, SADFACE, HEARTH, SMILE}

var type = BROKEN
var side = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func setType(type):
	type = type
	setSide(true)
	pass
	
func setSide(isLeft):
	if isLeft:
		get_node(".").frame = type*2
	else:
		get_node(".").frame = type*2 + 1