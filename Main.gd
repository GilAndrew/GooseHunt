extends Node

#signal shot(shot_event)

onready var mediator = get_node("/root/Mediator")

export (PackedScene) var goose = load("res://goose.tscn")

var goose_counter = 2

var bullets = 3

var geese_to_spawn = 10

#func _init():
#	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	mediator.connect("hit", self, "_on_goose_hit")
	mediator.connect("bye", self, "_on_goose_bye")
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func new_game():
	$GooseTimer.start()

func game_over():
	print("Game over!")
	print("Go to the post-game screen (display the high scores, then time out to title screen)")
	SaveSystem.compareScore(Global.score)
	get_tree().change_scene("res://HighScoresAfterGame.tscn")
	$GooseTimer.stop()

func _input(event):
	if event is InputEventMouseButton :
		if (!(event.pressed)):
			pass
		elif (event.button_index == BUTTON_LEFT and event.pressed and bullets > 0):
			bullets -= 1
			#print("YOU FIRED A SHOT!")
			#print("Bullets left:", bullets)
			$Reticle.position = event.position
			$Reticle.show()
			$ReticleTimer.start()
			#emit_signal("shot", event)
			mediator.shot(event)	
		else :
			print("OUT OF AMMO")

func _on_goose_hit(_pos):
	#print("The goose was hit, says main")
	#print(pos)
	pass

func _on_ReticleTimer_timeout():
	$Reticle.hide()

func _on_GooseTimer_timeout():
	# on timeout, spawn a goose!
	if ($"/root/Global".num_rounds == 0) :
		game_over()
	
	elif geese_to_spawn == 0 :
		print("ROUND OVER")
		# will get rid of this (below) later, once we get rounds going, but for now, keep it to keep game going
		# change the below 2 lines to deal with new round behavior
		$"/root/Global".num_rounds -= 1
		print("Num rounds remaining:", $"/root/Global".num_rounds)
		geese_to_spawn = 10
		$GooseTimer.start()
	else :
		bullets = 3
		goose_counter = 2
		geese_to_spawn -=2
		print("Geese left:", geese_to_spawn)
		# below is the goose instantiation and 'starting' them, will move to another function later
		var goose_inst = goose.instance()
		goose_inst.type = "easy"
		goose_inst.dir = 0
		add_child(goose_inst)
		#var _e = connect("shot", goose_inst, "_on_shot_fired")
		#goose_inst.connect("hit", self, "_on_goose_hit")
		#goose_inst.connect("bye", self, "_on_goose_bye")
	
		#$GooseTimer.start()
		var goose2_inst = goose.instance()
		goose2_inst.type = "easy"
		goose2_inst.dir = 1
		add_child(goose2_inst)
		#var _f = connect("shot", goose2_inst, "_on_shot_fired")
		#goose2_inst.connect("hit", self, "_on_goose_hit")
		#goose2_inst.connect("bye", self, "_on_goose_bye")
	
func _on_goose_bye():
	# there will be 10 geese per round how many rounds
	goose_counter -= 1
	if (goose_counter == 0) :
		$GooseTimer.start()
	
