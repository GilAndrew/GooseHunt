extends Node

signal shot(shot_event)

var gooseFactory = load("res://goose_factory.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func new_game():
	
	# below is the goose instantiation and 'starting' them, will move to another funciton later
	var goose_inst = gooseFactory.newGoose("easy")
	#var goose_inst = goose.instance()
	
	add_child(goose_inst)
	connect("shot", goose_inst, "_on_shot_fired")
	goose_inst.connect("hit", self, "_on_goose_hit")
	
	# This stuff with startPos and the start call might be moved to easy_goose, etc.
	# especially the vector 2 thing
	var startPos = Position2D.new()
	startPos.position.x = 200
	startPos.position.y = 100
	goose_inst.start(startPos.position, Vector2(rand_range(100, 250), 0))
	# Some basic movement code, direction  and the rotation stuff will be taken into factor when we come up with movement paths
	#var direction = (PI / 2)
	#goose_inst.velocity = Vector2(rand_range(100, 250), 0)
	#linear_velocity = linear_velocity.rotated(PI / 2)


func _input(event):
	if event is InputEventMouseButton :
		if (event.button_index == BUTTON_LEFT and event.pressed):
			print("YOU FIRED A SHOT!")
			$Reticle.position = event.position
			$Reticle.show()
			print(event.position)
			emit_signal("shot", event)

			#$KinematicBody2D.
			#if (overlaps_area(event.position)) :
			#	hide()
			#	queue_free()


func _on_goose_hit(pos):
	print("The goose was hit, says main")
	print(pos)
	# reticule sprite appear
	#$Reticle.position = pos
	#$Reticle.show()


func _on_ReticleTimer_timeout():
	$Reticle.hide()
