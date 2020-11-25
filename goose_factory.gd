extends Node

class_name GooseFactory

var difficulty

var Goose = load("goose.tscn")

# This returns the "type" of goose as an identifier to the spawner
func _init():
	difficulty = {
		"easy": easyGoose,
		"intermediate": intermediateGoose,
		"hard": hardGoose
	}

# This basically creates the Goose instance and sets it's
# Script to the appropriate difficulty
func newGoose(type):
	var g = Goose.instance()
	if(type == "easy"):
		g.set_script(difficulty.get("easy"))
		return g
		
	elif(type == "intermediate"):
		g.set_script(difficulty.get("intermediate"))
		return g
	else :
		g.set_script(difficulty.get("hard"))
		return g
