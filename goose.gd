extends Area2D

class_name Goose

#signal hit(pos_shot)

#signal bye()

onready var mediator = get_node("/root/Mediator")

var gooseBehavior = load("res://goose_behavior.gd").new()

var screen_size
var type
var dir # if 0, going right, if 1 going left 
var speed
var min_speed
var max_speed

var velocity = Vector2()

#func _init():
#	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	mediator.connect("shot", self, "_on_shot_fired")
	screen_size = get_viewport_rect().size
	position.x = rand_range(400,500)
	position.y = 550
	gooseBehavior.newGoose(self, type)
	if (dir == 1) :
		$Sprite.set_flip_h(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	
	# now we change the velocity values to get some more "fun" movement
	if (dir == 0) :
		velocity.x += rand_range(-20,20)
	else :
		velocity.x += rand_range(-35,5)
	
	velocity.y += rand_range(-30,10)
	
	# we start at y = 400
	# we need a bound so that y is never greater than 400
	position.y = clamp(position.y, -500, 400)

func start(pos, v) :
	position = pos
	show()
	velocity = v

func _on_VisibilityNotifier2D_screen_exited():
	#print("deleting goose")
	#emit_signal("bye")
	mediator.bye()
	queue_free()
	
func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	#print("viewport left")
	#emit_signal("bye")
	mediator.bye()
	queue_free()
	

func _on_shot_fired(event) :
	#print("Goose says shot fired!")
	
	if ( (event.position.x < (position.x + 50)) && (event.position.x > (position.x - 50)) && (event.position.y < (position.y + 59)) && (event.position.y > (position.y - 59)) ) :
		#print("Goose was hit, says Goose!")
		hide()
		#emit_signal("hit", event.position)
		#emit_signal("bye")
		mediator.hit(event.position)
		mediator.bye()
		queue_free()
	#else :
		#print("Goose says miss!")
