extends Sprite

var t = 0
var speed_v = randf()*10+30
var speed_h = randf()*5

func _process(delta):
	t += delta
	translate(Vector2(0, -speed_v)*delta)
	position.x = sin(t*speed_h)*6
	
	if position.y < -100:
		queue_free()