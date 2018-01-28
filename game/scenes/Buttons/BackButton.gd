extends TextureButton

func _ready():
	self.connect("pressed", self, "backButtonPressed")
	pass

func backButtonPressed():
	get_node("/root/music").get_node("ButtonSound").play("botao")
	var sceneName = get_tree().get_current_scene().get_name()
	if(sceneName == "CutScene" or sceneName == "Credits" or sceneName == "Scoreboard"):
		get_tree().change_scene("res://scenes/menu.tscn")
	elif(sceneName == "HowToPlay"):
		get_tree().change_scene("res://scenes/cutScene.tscn")