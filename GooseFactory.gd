extends Node

class_name GooseFactory

var difficulty

# This returns the "type" of goose as an identifier to the spawner
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
	else :
		return difficulty.get("hard")
