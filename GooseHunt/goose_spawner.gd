extends Node

class_name GooseSpawner

var factory

# Note, this may be superflous, perhaps Main could call the spawner?


# Gets the difficulty type (and later behavior) from factory, 
func generateGoose(type):
	factory = GooseFactory.new()
	var goose = factory.newGoose(type)
	#goose.name = type
	return goose
