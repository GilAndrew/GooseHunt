extends "goose.gd"

class_name hardGoose

func _ready():
	# MIGHT CUT speed
	speed = 400
	min_speed = 375
	max_speed = 425
	# move direciton,
	
	var startPos = Position2D.new()
	startPos.position.x = 200
	startPos.position.y = 100
	# the Vector2 is the velocity so a random range from (100,250) in the +x direciton
	# and 0 in the y direction
	var velocity = Vector2(rand_range(min_speed,max_speed), 0)
	start(startPos.position, velocity)
