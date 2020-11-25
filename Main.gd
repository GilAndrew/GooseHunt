extends Node

var gooseSpawner = load("res://goose_spawner.gd").new()

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func new_game():
	var goose_inst = gooseSpawner.generateGoose("easy")
	#var goose_inst = goose.instance()
	
	add_child(goose_inst)
	goose_inst.connect("shot", self, "_on_goose_shot")
	var startPos = Position2D.new()
	startPos.position.x = 200
	startPos.position.y = 100
	goose_inst.start(startPos.position)
	# Some basic movement code, direction  and the rotation stuff will be taken into factor when we come up with movement paths
	#var direction = (PI / 2)
	goose_inst.linear_velocity = Vector2(rand_range(100, 250), 0)
	#linear_velocity = linear_velocity.rotated(PI / 2)

func _on_goose_shot():
	print("The goose was shot, says main")
