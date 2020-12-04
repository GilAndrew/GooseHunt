#extends Goose

class_name GooseBehavior

#var difficulty

# This returns the "type" of goose as an identifier to the spawner
# can be used as part of the script loading, for other things, if we wanted to extend the functionality
# if we want to go ham, make it goose, turkey, dodo, etc. all inherit from abstract bird
# and get real crazy with this. If we do that, then the script loader will come in handy
#func _init():
#	difficulty = {
#		"easy": easyGoose,
#		"intermediate": intermediateGoose,
#		"hard": hardGoose
#	}

# This basically creates the Goose instance and sets it's
# Script to the appropriate difficulty
# g is an instance of goose
func newGoose(g, type):
	match type:
		"easy":
			#g.set_script(difficulty.get("easy"))
			
			# intrinsic, these aren't gonna change
			g.speed = 300
			g.min_speed = 300
			g.max_speed = 350
			#var startPos = Position2D.new()
			#startPos.position.y = 550
			
			# extrinsic, this will change, it's random
			#startPos.position.x = rand_range(500,1000)
			
			# the Vector2 is the velocity so a random range from (100,250) in the +x direciton
			# and 0 in the y direction
			var x_speed = rand_range(g.min_speed, g.max_speed)
			if g.dir == 1 :
				x_speed *= -1
				
			var velocity = Vector2(x_speed, rand_range(g.min_speed, g.max_speed))
			g.start(g.position, velocity)

		"intermediate":
			#g.set_script(difficulty.get("intermediate"))
				# MIGHT CUT speed
			g.speed = 400
			g.min_speed = 400
			g.max_speed = 450
			# move direciton,
	
			#var startPos = Position2D.new()
			#startPos.position.x = rand_range(500,1000)
			#startPos.position.y = 550
			# the Vector2 is the velocity so a random range from (100,250) in the +x direciton
			# and 0 in the y direction
			var velocity = Vector2(rand_range(g.min_speed, g.max_speed), 0)
			g.start(g.position, velocity)
		"hard":
			#g.set_script(difficulty.get("hard"))
			# MIGHT CUT speed
			g.speed = 500
			g.min_speed = 500
			g.max_speed = 550
			# move direciton,
	
			#var startPos = Position2D.new()
			#startPos.position.x = rand_range(500,1000)
			#startPos.position.y = 550
			# the Vector2 is the velocity so a random range from (100,250) in the +x direciton
			# and 0 in the y direction
			var velocity = Vector2(rand_range(g.min_speed, g.max_speed), 0)
			g.start(g.position, velocity)
	#return g
