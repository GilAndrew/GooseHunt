extends Label

func _process(_delta):
	text = "Score: " + String(Global.score)
