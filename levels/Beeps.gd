extends Sprite

func _process(delta):
	if randi()%60 == 0:
		$Beep.play()