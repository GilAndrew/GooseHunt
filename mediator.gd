extends Node

# This mediator will act as a central hub for signals, it takes them in and passes them along as needed
# Basically to work as an inter-scene signal handler
# nodes that are signaling inside of scenes (intra-scene signaling) isn't what this is for

signal hit(pos_shot)

signal bye()

signal shot(shot_event)

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
# main receiving from Goose
func _on_goose_hit(_pos):
	print("The goose was hit, says mediator")
	#print(pos)
	#pass
	
# main receiving from Goose
func _on_goose_bye():
	print("Mediator says Goose said bye!")
	#pass

# goose receiving from main
func on_shot_fired(event) :
	print("Shot fired in Main, says Mediator")
	#goose.on_shot_fired(event)
	#signal()
	#pass
