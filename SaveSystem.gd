extends Node
#This is a singleton
	
var save_path = "res://save.txt"
var file = File.new()
	
func loadScores():
	file.open(save_path, File.READ)
	var data = file.get_var()
	$"/root/Global".highscore = data[9]
	#$"/root/Global".allscores = data
	file.close()
	
func compareScore(newscore):
	file.open(save_path, File.READ)
	var data = file.get_var()
	var i = 0
	while i < 10:
		if data[i] < newscore:
			data[0] = newscore
			data.sort()
			#print(data[9])
			replaceScores(data)
			break
		i += 1
	file.close()
	
func replaceScores(newScores):
	file.open(save_path, File.WRITE)
	file.store_var(newScores)
	print(newScores[0])
	file.close()
	
func returnScores():
	file.open(save_path, File.READ)
	var data = file.get_var()
	file.close()
	return data
	
func highestScore():
	file.open(save_path, File.READ)
	var data = file.get_var()
	file.close()
	#print(data[0])
	return data[9]
	
	
	
