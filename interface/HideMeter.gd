extends Node2D

var level = 0.0


func _ready():
	pass

func _process(delta):
	var p = ($Background.texture.get_size().y-8)*level
	
	$MeterLine.position.y = -p-2
	$MeterLine.scale.y = p/3-0.6
	
	if level > 0:
		level -= delta*0.01
#	pass
