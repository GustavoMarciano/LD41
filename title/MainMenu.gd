extends CanvasLayer

var volume_number = -80

func _ready():
	$ThemeSong.volume_db = volume_number
	$ThemeSong/VolumeTimer.start()
	pass

func _on_VolumeTimer_timeout():
	while volume_number < 0:
		volume_number += 10
		$ThemeSong.volume_db = volume_number
		$ThemeSong/VolumeTimer.start()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
