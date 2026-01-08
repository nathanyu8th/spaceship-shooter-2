extends Area2D

@export var speed: int= 500

func _ready():
	get_tree().create_timer(10.0).timeout.connect(queue_free)
	
func _process(delta: float) -> void:
	position += Vector2(0, -1.0) * speed * delta
	


func _on_area_entered(area: Area2D) -> void:
	#destroy meteor and laser when colliding with meteor
	area.call_deferred("queue_free")
	call_deferred("queue_free")
