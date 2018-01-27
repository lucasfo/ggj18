extends TextureButton

func _ready():
	self.connect("pressed", self, "startButtonPressed")
	pass
	
func startButtonPressed():
	get_tree().change_scene("res://scenes/cutScene.tscn")
