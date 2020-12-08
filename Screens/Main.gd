extends Node

# This gives us access to the instance of the Mediator Singleton and the Global singleton
onready var mediator = get_node("/root/Mediator")
onready var global = get_node("/root/Global")
var goose = preload("res://goose.tscn")

var goose_counter = 2
var bullets = 3
var geese_to_spawn = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	mediator.connect("bye", self, "_on_goose_bye")
	new_game()

func new_game():
	$GooseTimer.start()

func game_over():
	$"/root/SaveSystem".compareScore(global.score)
	var _e = get_tree().change_scene("res://Screens/ScoreScreen.tscn")
	$GooseTimer.stop()

func _input(event):
	if event is InputEventMouseButton :
		if (!(event.pressed)):
			pass
		elif (event.button_index == BUTTON_LEFT and event.pressed and bullets > 0):
			bullets -= 1
			$Reticle.position = event.position
			$Reticle.show()
			$ReticleTimer.start()
			mediator.shot(event)	
		else :
			print("OUT OF AMMO")

func _on_ReticleTimer_timeout():
	$Reticle.hide()

func _on_GooseTimer_timeout():
	# on timeout, spawn a goose!
	if (global.num_rounds == 0) :
		game_over()
	
	elif geese_to_spawn == 0 :
		print("ROUND OVER")
		global.num_rounds -= 1
		print("Num rounds remaining:", global.num_rounds)
		geese_to_spawn = 10
		$GooseTimer.start()
	else :
		bullets = 3
		goose_counter = 2
		geese_to_spawn -=2
		
		# below is the goose instantiation into Main's scene tree and 'starting' them
		var goose_inst = goose.instance()
		goose_inst.dir = 0
		add_child(goose_inst)
	
		var goose2_inst = goose.instance()
		goose2_inst.dir = 1
		add_child(goose2_inst)
		
		# With these calls to add_child, this isntances the goose scenes into Main
		# it's added goose's sub-tree of nodes into Main's. Thus this is an example
		# of the Composite design pattern, which is central to Godot.

func _on_goose_bye():
	# there will be 10 geese per round
	goose_counter -= 1
	if (goose_counter == 0) :
		$GooseTimer.start()
	
