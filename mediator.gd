extends Node

# This mediator will act as a central hub for signals, it takes them in and passes them along as needed
# Basically to work as an inter-scene signal handler
# nodes that are signaling inside of scenes (intra-scene signaling) isn't what this is for
# The point, instead of the scenes signalling each other back and forth, 
#they call the appropriate function for mediator
# mediator emits signals, scenes receive them!

# Also a singleton, since this node has been auto-loaded, it acts like a singleton (global access)

# however, Godot does not support making constructors private, so it is possible to have multiple instances of Mediator
# but we are gonna be on our best behavior and only have one instance of this Class/Node (the instance that's autoloaded)

# we could try to imitate the getInstance/private constructor behavior
# by creating a variable here med which is the result of get_node(Mediator)
# then we create a function called get_med() which returns med, an instance of our Mediator
# a bit needless since Godot kinda handles all that behind the scenes, 
# but it does make the process explicit (similar to the instance_node) in Global.gd


signal hit(pos_shot)
signal bye()
signal shot(shot_event)

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func hit(pos):
	#print("Mediator hears goose say hit")
	emit_signal("hit", pos)

func bye():
	#print("Mediator hears goose say bye")
	emit_signal("bye")
	
func shot(event):
	#print("Mediator hears main say shot fired")
	emit_signal("shot", event)
