extends RichTextLabel

onready var timer = get_parent().get_child(5)
onready var stringPrinted = "You know, there is this story I have to type here sometime. Kkk"

func _ready():
	timer.set_wait_time(.1) # Time between letters
	_dialogue(stringPrinted)
	pass

func _dialogue(string):
	for letter in string:
		timer.start()
		self.add_text(letter)
		yield(timer, "timeout")