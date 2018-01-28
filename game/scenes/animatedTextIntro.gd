extends RichTextLabel

onready var timer = get_parent().get_child(6)
onready var stringPrinted = "Hey! Listen up you lazybones! Time to work!\nThe dog village has been too happy lately…\nTHAT’S UNACCEPTABLE! We demons despise happiness! And dogs! And most of all GOOD VIBES!\nYour job is to transmit bad vibes to those awful barkers.\nDO IT FAST OR I’LL FIRE YOU!"

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