extends TextureButton

onready var scoreInfo = get_node("/root/scoreboardInfo")

func _ready():
	scoreInfo.show()
	self.connect("pressed", self, "continueButtonPressed")
	pass

func continueButtonPressed():
	get_node("/root/music").get_node("ButtonSound").play("botao")
	var sceneName = get_tree().get_current_scene().get_name()
	if(sceneName == "CutScene"):
		get_tree().change_scene("res://scenes/HowToPlay.tscn")
	elif(sceneName == "HowToPlay"):
		get_tree().change_scene("res://scenes/game/game.tscn")
	elif(sceneName == "DieScene"):
			if(scoreInfo.newPosition > 0):
				get_tree().change_scene("res://scenes/enterNewName.tscn")
			elif(scoreInfo.newPosition == 0):
				get_tree().change_scene("res://scenes/menu.tscn")
