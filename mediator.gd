extends Node

# This mediator will act as a central hub for signals, it takes them in and passes them along as needed
# Basically to work as an inter-scene signal handler
# nodes that are signaling inside of scenes (intra-scene signaling) isn't what this is for
# The point, instead of the scenes signalling each other back and forth, 
# they call the appropriate function for mediator, mediator emits signals, scenes receive them!

# Also a singleton, since this node has been auto-loaded, it acts like a singleton (global access)
# however, Godot does not support making constructors private, so it is possible to have multiple instances of Mediator
# but we are gonna be on our best behavior and only have one instance of this Class/Node (the instance that's autoloaded)
# a get_instance method also already exists, as we can just call get_node("/root/Mediator") when needed

signal bye()
signal shot(shot_event)
	
func hit(pos, val):
	$"/root/Global".score += val

func bye():
	emit_signal("bye")
	
func shot(event):
	emit_signal("shot", event)
