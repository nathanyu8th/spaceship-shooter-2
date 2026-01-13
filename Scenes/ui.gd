extends CanvasLayer

var image = load("res://PNG/playerShip1_red.png")


func set_health(amount):
	# remove all children from Hbox Container
	for child in $MarginContainer/HBoxContainer.get_children():
		child.queue_free()
	
	#create new children based on health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
