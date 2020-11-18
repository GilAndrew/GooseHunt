extends Node

var spawner

func _ready():
	spawner = GooseSpawner.new()
	spawner.generateGoose("easy")
	
