extends Node2D

var count = 1
var pressed = false
var second = preload("res://scenes/Tutorial/TutorialTwo.tscn")
var third = preload("res://scenes/Tutorial/TutorialThree.tscn")
var fourth = preload("res://scenes/Tutorial/TutorialFour.tscn")
onready var scoreInfo = get_node("/root/scoreboardInfo")

func _ready():
	set_process(true)
	pass
	
func _process(delta):
	if(Input.is_key_pressed(KEY_SPACE) and !pressed):
		pressed = true
		var oldScene = self.get_child(0)
		var newScene
		oldScene.free()
		if(count == 1):
			# load 2
			newScene = second.instance()
			self.add_child(newScene)
		elif(count == 2):
			# load 3
			newScene = third.instance()
			self.add_child(newScene)
		elif(count == 3):
			# load 4
			newScene = fourth.instance()
			self.add_child(newScene)
		elif(count == 4):
			get_tree().change_scene("res://scenes/game/game.tscn")
		count = count + 1
	elif(!Input.is_key_pressed(KEY_SPACE) and pressed):
		pressed = false
	pass
