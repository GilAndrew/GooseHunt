extends Node

func _ready():
	$returnButton.connect("pressed", self, "_on_Button_Pressed", [$returnButton.scene_to_load])

func _on_Button_Pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
