extends Node

signal shot(shot_event)

export (PackedScene) var goose = load("res://goose.tscn")

#onready var mediator = get_node("/root/Mediator")

var goose_counter = 2

var bullets = 3

func _init():
	#connect("shot", Mediator, "_on_shot_fired")
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func new_game():
	$GooseTimer.start()


func _input(event):
	if event is InputEventMouseButton :
		print(event.position)
		if (!(event.pressed)):
			pass
		elif (event.button_index == BUTTON_LEFT and event.pressed and bullets > 0):
			bullets -= 1
			#print("YOU FIRED A SHOT!")
			#print("Bullets left:", bullets)
			$Reticle.position = event.position
			$Reticle.show()
			emit_signal("shot", event)
			#mediator.on_shot_fired(event)
			
		else :
			print("OUT OF AMMO")

#func _on_goose_hit(_pos):
	#print("The goose was hit, says main")
	#print(pos)
#	pass

func _on_ReticleTimer_timeout():
	$Reticle.hide()

func _on_GooseTimer_timeout():
	# on timeout, spawn a goose!

	bullets = 3
	goose_counter = 2
	
	# below is the goose instantiation and 'starting' them, will move to another function later
	var goose_inst = goose.instance()
	goose_inst.type = "easy"
	goose_inst.dir = 0
	add_child(goose_inst)
	var _e = connect("shot", goose_inst, "_on_shot_fired")
	goose_inst.connect("hit", self, "_on_goose_hit")
	goose_inst.connect("bye", self, "_on_goose_bye")
	
	#$GooseTimer.start()
	var goose2_inst = goose.instance()
	goose2_inst.type = "easy"
	goose2_inst.dir = 1
	add_child(goose2_inst)
	var _f = connect("shot", goose2_inst, "_on_shot_fired")
	goose2_inst.connect("hit", self, "_on_goose_hit")
	goose2_inst.connect("bye", self, "_on_goose_bye")
	
func _on_goose_bye():
	# there will be 10 geese per round how many rounds
	goose_counter -= 1
	if (goose_counter == 0) :
		$GooseTimer.start()
	
