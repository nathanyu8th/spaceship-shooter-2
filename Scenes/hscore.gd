extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ScoreLayer.high_score_changed.connect(_on_high_score_changed)
	_on_high_score_changed(ScoreLayer.high_score)
	


func _on_high_score_changed(new_high_score: int):
	text = "High Score: %d" % new_high_score
