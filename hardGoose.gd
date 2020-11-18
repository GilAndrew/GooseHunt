extends Node


class_name hardGoose

func _ready():
	var easyscene = load("res://entity.tscn")
	
	return easyscene.instance()
	
#These are for laterrrr
#var move_speed = Vector2(x,x)
#var min_move_speed = x
#var friction = x
#func _ready():
