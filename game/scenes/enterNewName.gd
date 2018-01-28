extends Node2D

var nameText = self.get_child(2)
var text = get_child(2)

func _ready():
	set_process_input(true)
	pass
	
func _input(event):
	if(event.is_action_released("writing")):
		print("coisas")
