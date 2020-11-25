extends Node
#This is a singleton
#https://www.youtube.com/watch?v=ygGaN1EOQEA&feature=emb_logo
var highscore = 0

var save_path = "res://saveFile.cfg"
var config = ConfigFile.new()
var load_response = config.load(save_path)


func _ready():
	pass # Replace with function body.
	
func saveScore(section, key):
	config.set_value(section, key, highscore)
	config.save(save_path)
	
func loadScore(section, key):
	highscore = config.get_value(section, key, highscore)
	
