extends Area2D

class_name Goose

# This gives us access to the instance of the Mediator Singleton and the Global singleton
onready var mediator = get_node("/root/Mediator")
onready var global = get_node("/root/Global")
var gooseBehavior = load("res://goose_behavior.gd").new()

var screen_size
var type
var dir # if 0, going right, if 1 going left 
var speed
var min_speed
var max_speed
var value
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	mediator.connect("shot", self, "_on_shot_fired")
	type = global.difficulty
	screen_size = get_viewport_rect().size
	position.x = rand_range(400,500)
	position.y = 500
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
		velocity.x += rand_range(-10,10)
	else :
		velocity.x += rand_range(-15,5)
	
	velocity.y += rand_range(-30,10)
	
	# we set a bound at 500, so the geese don't spawn below dirt
	position.y = clamp(position.y, -500, 500)

func start(pos, v) :
	position = pos
	show()
	velocity = v

# This is called whenever the signals from VisibilityNotifier2D are emitted
# It is an implementation of Observer, Goose is "observing" the VisibilityNotifier2D
func _on_VisibilityNotifier2D_screen_exited():
	mediator.bye()
	queue_free()
	
func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	mediator.bye()
	queue_free()
	
func _on_shot_fired(event) :
	if ( (event.position.x < (position.x + 50)) && (event.position.x > (position.x - 50)) && (event.position.y < (position.y + 59)) && (event.position.y > (position.y - 59)) ) :
		hide()
		mediator.hit(event.position, value)
		mediator.bye()
		queue_free()
