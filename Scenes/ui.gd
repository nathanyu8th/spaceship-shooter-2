extends CanvasLayer

var image = load("res://PNG/playerShip1_red.png")

func set_health(amount):
	
	#remove all children froim Hbox Container
	for child in $MarginContainer/HBoxContainer.get_children():
		child.queue_free()
		
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.tecture = image
		$MarginContainer/HBoxContainer.add(text_rect)
