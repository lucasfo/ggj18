extends TextureButton

func _ready():
	self.connect("pressed", self, "scoreboardButtonPressed")
	pass
	
func scoreboardButtonPressed():
	get_tree().change_scene("res://scenes/Scoreboard.tscn")
