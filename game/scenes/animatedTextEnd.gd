extends RichTextLabel

onready var timer = get_parent().get_child(4)
onready var stringPrinted = "At this rate the dogs' vibe will rule and my businees will be ruined! YOU ARE FIRED!!"

func _ready():
	timer.set_wait_time(.05) # Time between letters
	_dialogue(stringPrinted)
	pass

func _dialogue(string):
	for letter in string:
		get_node("SamplePlayer2D").play("texto")
		timer.start()
		self.add_text(letter)
		yield(timer, "timeout")