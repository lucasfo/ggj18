extends Node2D

onready var scoreInfo = get_node("/root/scoreboardInfo")
onready var name1 = get_child(3)
onready var name2 = get_child(4)
onready var name3 = get_child(5)
onready var name4 = get_child(6)

func _ready():
	scoreInfo.show()
	if(scoreInfo.newPosition > 0):
		if(scoreInfo.newPosition <= 4):
			scoreInfo.player4 = ""
			scoreInfo.score4 = 0
			if(scoreInfo.newPosition <= 3):
				scoreInfo.player4 = scoreInfo.player3
				scoreInfo.score4 = scoreInfo.score3
				if(scoreInfo.newPosition <= 2):
					scoreInfo.player3 = scoreInfo.player2
					scoreInfo.score3 = scoreInfo.score2
					if(scoreInfo.newPosition == 1):
						scoreInfo.player2 = scoreInfo.player1
						scoreInfo.score2 = scoreInfo.score1
						scoreInfo.player1 = scoreInfo.newName
						scoreInfo.score1 = scoreInfo.newScore
					elif(scoreInfo.newPosition > 1):
						scoreInfo.player2 = scoreInfo.newName
						scoreInfo.score2 = scoreInfo.newScore
				elif(scoreInfo.newPosition > 2):
					scoreInfo.player3 = scoreInfo.newName
					scoreInfo.score3 = scoreInfo.newScore
			elif(scoreInfo.newPosition > 3):
				scoreInfo.player4 = scoreInfo.newName
				scoreInfo.score4 = scoreInfo.newScore
		# set texts
	name1.set_text(scoreInfo.player1)
	if(scoreInfo.score1 > 0):
		name1.get_child(0).set_text(String(scoreInfo.score1))
	name2.set_text(scoreInfo.player2)
	if(scoreInfo.score2 > 0):
		name2.get_child(0).set_text(String(scoreInfo.score2))
	name3.set_text(scoreInfo.player3)
	if(scoreInfo.score3 > 0):
		name3.get_child(0).set_text(String(scoreInfo.score3))
	name4.set_text(scoreInfo.player4)
	if(scoreInfo.score4 > 0):
		name4.get_child(0).set_text(String(scoreInfo.score4))
	scoreInfo.newPosition = 0
	scoreInfo.newName = ""
	scoreInfo.newScore = 0
	pass
