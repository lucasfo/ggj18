extends Node2D

# Pega o botão amiguinho
export (NodePath) var startButtonPath
export (NodePath) var creditsButtonPath
onready var startButton = get_node(startButtonPath)
onready var creditsButton = get_node(creditsButtonPath)

func _ready():
	startButton.connect("pressed", self, "onStartPressed")
	creditsButton.connect("pressed", self, "onCreditsPressed")
	pass

func onStartPressed():
	print("Start pressed")
	get_tree().change_scene("res://scenes/cutScene.tscn")
	
func onCreditsPressed():
	print("Credits pressed")
	get_tree().change_scene("res://scenes/Credits.tscn")