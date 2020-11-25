extends RigidBody2D

class_name Goose

signal shot

var spawner
var goose

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#spawner = GooseSpawner.new()
	#goose = spawner.generateGoose("easy")
	#var startPos = Position2D.new()
	#startPos.position.x = 200
	#startPos.position.y = 100
	#start(startPos.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start(pos) :
	position = pos
	show()

func _input(event):
	if event is InputEventMouseButton :
		if (event.button_index == BUTTON_LEFT and event.pressed):
			hide()
			emit_signal("shot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
