extends CharacterBody2D


@export var speed: int = 500
var canShoot: bool = true

signal laser(pos)

func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	
	#movement based on player input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and canShoot:
		#shoot laser
		
		laser.emit($laserMarker.global_position)
		canShoot = false
		$laserTimer.start()

func _on_laser_timer_timeout() -> void:
	canShoot = true
