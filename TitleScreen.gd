extends Node

func _ready():
	SaveSystem.loadScores()
	#SaveSystem.compareScore(21)
	$"/root/Global".highscore = SaveSystem.highestScore()
	
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_Pressed", [button.scene_to_load])
	
func _on_Button_Pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
