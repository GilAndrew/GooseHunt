extends Node

class_name GooseFactory

var difficulty

func _init():
	difficulty = {
		"easy": easyGoose,
		"intermediate": intermediateGoose,
		"hard": hardGoose
	}

func newGoose(type):
	if(type == "easy"):
		return difficulty.get("easy")
	elif(type == "intermediate"):
		return difficulty.get("intermediate")
	elif(type == "hard"):
		return difficulty.get("hard")
	
	return
