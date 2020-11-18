extends Node

class_name GooseSpawner

var factory
var goose

func generateGoose(type):
	factory = GooseFactory.new()
	goose = factory.newGoose(type).new()
	var entity = goose
	entity.position.y = 10
	entity.name = type
	add_child(entity)
	
