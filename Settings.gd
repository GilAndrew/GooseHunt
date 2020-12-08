extends Node

func _ready():
	$returnButton.connect("pressed", self, "_on_Button_Pressed", [$returnButton.scene_to_load])
	$ClearScores.connect("pressed", self, "clear_Scores")
	for checkbox in $Difficulty/Buttons.get_children():
		checkbox.connect("pressed", self, "change_difficulty", [checkbox.difficulty])
	
	
func _on_Button_Pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
	
func clear_Scores():
	print("Clearing High Scores")
	SaveSystem.resetScores()
	
func change_difficulty(difficulty):
	#print("doin the thing part 2")
	if difficulty == "easy":
		print("difficulty changed to easy")
		$Difficulty/Buttons/Medium.pressed = false
		$Difficulty/Buttons/Hard.pressed = false
		Global.difficulty = "easy"
		
	elif difficulty == "medium":
		print("difficulty changed to medium")
		$Difficulty/Buttons/Easy.pressed = false
		$Difficulty/Buttons/Hard.pressed = false
		Global.difficulty = "medium"
		
	elif difficulty == "hard":
		print("difficulty changed to hard")
		$Difficulty/Buttons/Medium.pressed = false
		$Difficulty/Buttons/Easy.pressed = false
		Global.difficulty = "hard"
