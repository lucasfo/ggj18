extends RichTextLabel

onready var timer = get_parent().get_child(4)
onready var stringPrinted = "At this rate the dogs' vibe will rule and my businees will be ruined! YOU ARE FIRED!!"

func _ready():
	timer.set_wait_time(.1) # Time between letters
	_dialogue(stringPrinted)
	pass

func _dialogue(string):
	for letter in string:
		timer.start()
		self.add_text(letter)
		yield(timer, "timeout")