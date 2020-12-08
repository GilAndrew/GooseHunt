extends Node

func _ready():
	$returnButton.connect("pressed", self, "_on_Button_Pressed", [$returnButton.scene_to_load])
	$MenuButton.connect("pressed", self, "clear_Scores")
	for checkbox in $Difficulty/Buttons.get_children():
		checkbox.connect("pressed", self, "change_difficulty", [checkbox.difficulty])
	
	
func _on_Button_Pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
	
func clear_Scores():
	SaveSystem.resetScores()
	
func change_difficulty(difficulty):
	#print("doin the thing part 2")
	if difficulty == "easy":
		$Difficulty/Buttons/Medium.pressed = false
		$Difficulty/Buttons/Hard.pressed = false
		Global.difficulty = "easy"
		
	elif difficulty == "medium":
		$Difficulty/Buttons/Easy.pressed = false
		$Difficulty/Buttons/Hard.pressed = false
		Global.difficulty = "medium"
		
	elif difficulty == "hard":
		$Difficulty/Buttons/Medium.pressed = false
		$Difficulty/Buttons/Easy.pressed = false
		Global.difficulty = "hard"
	
	
	
