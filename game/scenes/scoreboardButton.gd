extends TextureButton

func _ready():
	self.connect("pressed", self, "scoreboardButtonPressed")
	pass
	
func scoreboardButtonPressed():
	get_node("/root/music").get_node("ButtonSound").play("botao")
	get_tree().change_scene("res://scenes/Scoreboard.tscn")
