extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Score: 0"
	ScoreLayer.score_changed.connect(_on_score_changed)


func _on_score_changed(new_score: int):
	text = "Score: %d" % new_score
