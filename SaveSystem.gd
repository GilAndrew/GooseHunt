extends Node
#This is a singleton

# https://www.youtube.com/watch?v=ygGaN1EOQEA&feature=emb_logo
# The above tutorial was used as a reference
	
var save_path = "res://save.txt"
var file = File.new()
	
func resetScores():
	var newScore = [0, 0, 0, 0, 0, 0, 0 , 0, 0, 0]
	file.open(save_path, File.WRITE)
	file.store_var(newScore)
	file.close()
	
func compareScore(newscore):
	file.open(save_path, File.READ)
	var data = file.get_var()
	var i = 0
	while i < 10:
		if data[i] < newscore:
			data[0] = newscore
			data.sort()
			replaceScores(data)
			break
		i += 1
	file.close()
	
func replaceScores(newScores):
	file.open(save_path, File.WRITE)
	file.store_var(newScores)
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
	return data[9]
	
	
	
