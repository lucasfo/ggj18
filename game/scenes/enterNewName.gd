extends Node2D

onready var scoreInfo = get_node("/root/scoreboardInfo")
onready var text = self.get_child(2)

func _ready():
	set_process_input(true)
	pass
	
func _input(event):
	if(event.is_action_pressed("writing")):
		if(Input.is_key_pressed(KEY_A)):
			if(text.get_text() == ""):
				text.set_text("A")
			else:
				text.set_text(text.get_text() + "A")
		elif(Input.is_key_pressed(KEY_B)):
			if(text.get_text() == ""):
				text.set_text("B")
			else:
				text.set_text(text.get_text() + "B")
		elif(Input.is_key_pressed(KEY_C)):
			if(text.get_text() == ""):
				text.set_text("C")
			else:
				text.set_text(text.get_text() + "C")
		elif(Input.is_key_pressed(KEY_D)):
			if(text.get_text() == ""):
				text.set_text("D")
			else:
				text.set_text(text.get_text() + "D")
		elif(Input.is_key_pressed(KEY_E)):
			if(text.get_text() == ""):
				text.set_text("E")
			else:
				text.set_text(text.get_text() + "E")
		elif(Input.is_key_pressed(KEY_F)):
			if(text.get_text() == ""):
				text.set_text("F")
			else:
				text.set_text(text.get_text() + "F")
		elif(Input.is_key_pressed(KEY_G)):
			if(text.get_text() == ""):
				text.set_text("G")
			else:
				text.set_text(text.get_text() + "G")
		elif(Input.is_key_pressed(KEY_H)):
			if(text.get_text() == ""):
				text.set_text("H")
			else:
				text.set_text(text.get_text() + "H")
		elif(Input.is_key_pressed(KEY_I)):
			if(text.get_text() == ""):
				text.set_text("I")
			else:
				text.set_text(text.get_text() + "I")
		elif(Input.is_key_pressed(KEY_J)):
			if(text.get_text() == ""):
				text.set_text("J")
			else:
				text.set_text(text.get_text() + "J")
		elif(Input.is_key_pressed(KEY_K)):
			if(text.get_text() == ""):
				text.set_text("K")
			else:
				text.set_text(text.get_text() + "K")
		elif(Input.is_key_pressed(KEY_L)):
			if(text.get_text() == ""):
				text.set_text("L")
			else:
				text.set_text(text.get_text() + "L")
		elif(Input.is_key_pressed(KEY_M)):
			if(text.get_text() == ""):
				text.set_text("M")
			else:
				text.set_text(text.get_text() + "M")
		elif(Input.is_key_pressed(KEY_N)):
			if(text.get_text() == ""):
				text.set_text("N")
			else:
				text.set_text(text.get_text() + "N")
		elif(Input.is_key_pressed(KEY_O)):
			if(text.get_text() == ""):
				text.set_text("O")
			else:
				text.set_text(text.get_text() + "O")
		elif(Input.is_key_pressed(KEY_P)):
			if(text.get_text() == ""):
				text.set_text("P")
			else:
				text.set_text(text.get_text() + "P")
		elif(Input.is_key_pressed(KEY_Q)):
			if(text.get_text() == ""):
				text.set_text("Q")
			else:
				text.set_text(text.get_text() + "Q")
		elif(Input.is_key_pressed(KEY_R)):
			if(text.get_text() == ""):
				text.set_text("R")
			else:
				text.set_text(text.get_text() + "R")
		elif(Input.is_key_pressed(KEY_S)):
			if(text.get_text() == ""):
				text.set_text("S")
			else:
				text.set_text(text.get_text() + "S")
		elif(Input.is_key_pressed(KEY_T)):
			if(text.get_text() == ""):
				text.set_text("T")
			else:
				text.set_text(text.get_text() + "T")
		elif(Input.is_key_pressed(KEY_U)):
			if(text.get_text() == ""):
				text.set_text("U")
			else:
				text.set_text(text.get_text() + "U")
		elif(Input.is_key_pressed(KEY_V)):
			if(text.get_text() == ""):
				text.set_text("V")
			else:
				text.set_text(text.get_text() + "V")
		elif(Input.is_key_pressed(KEY_W)):
			if(text.get_text() == ""):
				text.set_text("W")
			else:
				text.set_text(text.get_text() + "W")
		elif(Input.is_key_pressed(KEY_X)):
			if(text.get_text() == ""):
				text.set_text("X")
			else:
				text.set_text(text.get_text() + "X")
		elif(Input.is_key_pressed(KEY_Y)):
			if(text.get_text() == ""):
				text.set_text("Y")
			else:
				text.set_text(text.get_text() + "Y")
		elif(Input.is_key_pressed(KEY_Z)):
			if(text.get_text() == ""):
				text.set_text("Z")
			else:
				text.set_text(text.get_text() + "Z")
	elif(Input.is_key_pressed(KEY_BACKSPACE)):
		if(text.get_text() != ""):
			var newT = text.get_text()
			newT.erase(text.get_text().length() - 1,1)
			text.set_text(newT)
	elif(Input.is_key_pressed(KEY_RETURN)):
		scoreInfo.newName = text.get_text()
		get_tree().change_scene("res://scenes/Scoreboard.tscn")