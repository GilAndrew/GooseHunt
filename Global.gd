extends Node

# Since this script is autoloaded by Godot, it is a Singleton

# https://docs.godotengine.org/en/stable/getting_started/step_by_step/singletons_autoload.html
# The above tutorial was used as a reference

var score = 0
var highscore
var num_rounds = 1
var difficulty = "easy"

func _ready():
	highscore = $"/root/SaveSystem".highestScore()

func reset():
	num_rounds = 1
	score = 0
