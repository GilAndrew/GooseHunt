extends Node

func _ready():
	$"/root/Global".reset()
	$"/root/Global".highscore = $"/root/SaveSystem".highestScore()
	$"Label/highscore/Score".text = str($"/root/Global".highscore)
	
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_Pressed", [button.scene_to_load])
	
func _on_Button_Pressed(scene_to_load):
	var _e = get_tree().change_scene(scene_to_load)
