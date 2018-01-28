extends Node

var player1 = ""
var score1 = 0

var player2 = ""
var score2 = 0

var player3 = ""
var score3 = 0

var player4 = ""
var score4 = 0

var newScore = 0
var newPosition = 0
var newName = ""

func enterNewScore(score):
	if(score > score4):
		# print("more than fourth")
		newScore = score
		if(score > score3):
			# print("More than third")
			if(score > score2):
				# print("More than second")
				if(score > score1):
					# print("More than first")
					newPosition = 1
				elif(score < score1):
					newPosition = 2
			elif(score < score2):
				newPosition = 3
		elif(score < score3):
			newPosition = 4