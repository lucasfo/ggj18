extends TextureButton

func _ready():
	self.connect("pressed", self, "creditsButtonPressed")
	pass

func creditsButtonPressed():
	get_tree().change_scene("res://scenes/Credits.tscn")