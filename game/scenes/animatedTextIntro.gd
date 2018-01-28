extends RichTextLabel

onready var timer = get_parent().get_node("Timer")
onready var stringPrinted = "An evil corporation ruled by a cat is trying to destroy all the happiness and good feelings spread by the dogs. Your mission is to transmit the bad feelings to the dogs, destroying them."

func _ready():
	timer.set_wait_time(.1) # Time between letters
	_dialogue(stringPrinted)
	pass

func _dialogue(string):
	for letter in string:
		timer.start()
		self.add_text(letter)
		yield(timer, "timeout")