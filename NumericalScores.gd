extends Label

var scores = ""

func _ready():
	var data = SaveSystem.returnScores()
	for i in range (0, data.size()):
		scores += String(i+1) + ".  " + String(data[9-i]) + "\n"
		
func _process(_delta):
	text = scores
