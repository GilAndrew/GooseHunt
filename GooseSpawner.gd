extends Node

class_name GooseSpawner

var factory
var goose

# Gets the difficulty type (and later behavior) from factory, 
func generateGoose(type):
	factory = GooseFactory.new()
	goose = factory.newGoose(type)
	#goose.start(200, 100)
	#goose.position.y = 100
	#goose.position.x = 200
	#goose.name = type
	return goose
