extends Node

func _ready():
	var _e = $returnButton.connect("pressed", self, "_on_Button_Pressed", [$returnButton.scene_to_load])
	
func _on_Button_Pressed(scene_to_load):
	var _e = get_tree().change_scene(scene_to_load)
