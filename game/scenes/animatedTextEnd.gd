extends RichTextLabel

onready var timer = get_parent().get_child(3)
onready var stringPrinted = "isded"

func _ready():
	timer.set_wait_time(.1) # Time between letters
	_dialogue(stringPrinted)
	pass

func _dialogue(string):
	for letter in string:
		timer.start()
		self.add_text(letter)
		yield(timer, "timeout")