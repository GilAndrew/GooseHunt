extends Node

func _ready():
	$fuckgoback.connect("pressed", self, "_on_Button_Pressed", [$fuckgoback.scene_to_load])
	
	
func _on_Button_Pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
