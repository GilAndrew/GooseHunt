extends Node
class_name GooseBehavior

# g is an instance of goose
func newGoose(g, type):
	match type:
		"easy":
			g.speed = 300
			g.min_speed = 300
			g.max_speed = 350
			g.value = 2
			var x_speed = rand_range(g.min_speed, g.max_speed)
			if g.dir == 1 :
				x_speed *= -1
			var velocity = Vector2(x_speed, rand_range(g.min_speed, g.max_speed))
			g.start(g.position, velocity)
		"medium":
			g.speed = 400
			g.min_speed = 400
			g.max_speed = 450
			g.value = 4
			var x_speed = rand_range(g.min_speed, g.max_speed)
			if g.dir == 1 :
				x_speed *= -1
			var velocity = Vector2(x_speed, rand_range(g.min_speed, g.max_speed))
			g.start(g.position, velocity)
		"hard":
			g.speed = 500
			g.min_speed = 500
			g.max_speed = 550
			g.value = 6
			var x_speed = rand_range(g.min_speed, g.max_speed)
			if g.dir == 1 :
				x_speed *= -1
			var velocity = Vector2(x_speed, rand_range(g.min_speed, g.max_speed))
			g.start(g.position, velocity)
