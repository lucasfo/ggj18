extends TextureButton

func _ready():
	self.connect("pressed", self, "backButtonPressed")
	pass

func backButtonPressed():
	var sceneName = get_tree().get_current_scene().get_name()
	print(sceneName)
	if(sceneName == "CutScene" or sceneName == "Credits"):
		get_tree().change_scene("res://scenes/menu.tscn")