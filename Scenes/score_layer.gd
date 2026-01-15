extends Node

var score: int = 0

signal score_changed(new_score)

func add_points(amount: int):
	score += amount
	score_changed.emit(score)
	
func reset():
	score = 0
	score_changed.emit(score)
