extends Area2D

@export var speed: int
@export var rotationSpeed: int = 300
@export var directionX: float = 300

signal collision

func _ready():
	var rng := RandomNumberGenerator.new()
	
	$Sprite2D.texture = get_random_meteor_texture()
	
	#random speed, position, and rotation
	var width = get_viewport().get_visible_rect().size[0]
	var randomX = rng.randi_range(0,width)
	var randomY = rng.randi_range(-150,-50)
	position = Vector2(randomX, randomY)
	
	speed = rng.randi_range(200,600)
	directionX = rng.randf_range(-1,1)
	rotationSpeed = rng.randi_range(40,100)
	
	#despawn object in 10 seconds
	get_tree().create_timer(10.0).timeout.connect(queue_free)
	
	
func get_random_meteor_texture() -> Texture2D:
	var dir := DirAccess.open("res://PNG/Meteors")
	if dir == null:
		push_error("Meteors folder not found")
		return null

	var pngs: Array[String] = []

	dir.list_dir_begin()
	var file := dir.get_next()
	while file != "":
		if not dir.current_is_dir() and file.ends_with(".png"):
			pngs.append("res://PNG/Meteors/" + file)
		file = dir.get_next()
	dir.list_dir_end()

	if pngs.is_empty():
		push_error("No meteor PNGs found")
		return null

	return load(pngs.pick_random())

	
	

func _process(delta):
	position += Vector2(directionX, 1.0) * speed * delta
	rotation_degrees += rotationSpeed * delta


func _on_body_entered(body: Node2D) -> void:
	#Collide with player to reset the scene
	#get_tree().call_deferred("reload_current_scene")
	
	collision.emit()
	
	#destroy meteor when hits a player
	queue_free()
