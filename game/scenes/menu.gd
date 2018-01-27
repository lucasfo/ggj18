extends Node2D

# Pega o botão amiguinho
export (NodePath) var button_path
onready var button = get_node(button_path)

func _ready():
	button.connect("pressed", self, "on_pressed")
	pass

func on_pressed():
	print("Oi")