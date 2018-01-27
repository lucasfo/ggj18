extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

enum {SADFACE, SMILE, BROKEN, HEARTH}

var type = BROKEN
var side = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func setType(t):
	print ("BAlloon ", t)
	type = t
	setSide(true)
	pass
	
func setSide(isLeft):
	if isLeft:
		get_node(".").set_frame(type*2+1)
	else:
		get_node(".").set_frame(type*2)

	print ("Frame ", get_node(".").frame)
