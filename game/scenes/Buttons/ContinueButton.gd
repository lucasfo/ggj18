extends TextureButton

func _ready():
	self.connect("pressed", self, "continueButtonPressed")
	pass

func continueButtonPressed():
	var sceneName = get_tree().get_current_scene().get_name()
	if(sceneName == "CutScene"):
		get_tree().change_scene("res://scenes/HowToPlay.tscn")
	elif(sceneName == "HowToPlay"):
		get_tree().change_scene("res://scenes/game/game.tscn")
