extends Node2D

export(int) var num_stars
export(float) var max_speed

var Stars = [
	preload("res://models/StarA.tscn"),
	preload("res://models/StarB.tscn"),
	preload("res://models/StarC.tscn")
]

func _ready():
	randomize()
	
	var screen_size = get_viewport().get_visible_rect().size
	
	#var direction = Vector2((randf()-0.5), (randf()-0.5))
	#direction /= direction.length()
	
	var direction = Vector2(1, 0)
	
	for i in range(0, num_stars):
		var star = Stars[randi()%Stars.size()].instance()
		
		star.translate(Vector2(randi()%int(screen_size.x),
					   		   randi()%int(screen_size.y)))
		
		star.speed = direction*max_speed*randf()
		
		add_child(star)
