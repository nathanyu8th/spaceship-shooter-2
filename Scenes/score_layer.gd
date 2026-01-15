extends Node

var score: int = 0
var high_score: int = 0

signal score_changed(new_score)
signal high_score_changed(high_score)

func add_points(amount: int):
	score += amount
	score_changed.emit(score)
	if high_score < score:
		high_score = score
		high_score_changed.emit(high_score)
	
	
func reset():
	score = 0
	score_changed.emit(score)
