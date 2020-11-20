extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawner
var goose

# Called when the node enters the scene tree for the first time.
func _ready():
	spawner = GooseSpawner.new()
	goose = spawner.generateGoose("easy")
	#add_child(goose) # this will be moved to "main" node/scene later
	#goose.start(200,100)
	var startPos = Position2D.new()
	startPos.position.x = 200
	startPos.position.y = 100
	start(startPos.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start(pos) :
	position = pos
	show()
	
