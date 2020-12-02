extends Area2D

class_name Goose

signal hit(pos_shot)

var screen_size
#var goose
var speed # this will be moved to the easy goose

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	#velocity = Vector2()
	screen_size = get_viewport_rect().size

	#var startPos = Position2D.new()
	#startPos.position.x = 200
	#startPos.position.y = 100
	#start(startPos.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# for changing speeds
	# velocity.x += somevalue
	# velocity.y += somevalue
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta


func start(pos, v) :
	position = pos
	show()
	velocity = v

#func _input(event):
#	if event is InputEventMouseButton :
#		if (event.button_index == BUTTON_LEFT and event.pressed):
#			hide()
#			queue_free()
#			emit_signal("hit", event.position)
			#$KinematicBody2D.
			#if (overlaps_area(event.position)) :
			#	hide()
			#	queue_free()



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_shot_fired(event) :
	print("Goose says shot fired!")
	
	# event is the event of you clicking
	# event.position is the exact coordinates of click
	# we need to check if event.position is inside the CollisionShape2D
	# if so then we signal a hit

	# always (1024, 600)
	# got (59, 50 ) from inspecetor
	# so width is 118
	# height is 100
	# right edge is pos + 50
	# left edge is pos - 50
	# up edge is pos + 59
	# down edge is pos - 59
	
	if ( (event.position.x < (position.x + 50)) && (event.position.x > (position.x - 50)) && (event.position.y < (position.y + 59)) && (event.position.y > (position.y - 59)) ) :
		print("Goose was hit, says Goose!")
		hide()
		queue_free()
		emit_signal("hit", event.position)
	else :
		print("Goose says miss!")
	
#func _on_Goose_body_entered(body):
	#pass # Replace with function body.
	
