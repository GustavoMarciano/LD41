extends CanvasLayer

func _ready():
	$ThemeSong/fade.play("song_fade")
	$PlayText/AnimationPlayer.play("shine")
	pass

func _unhandled_input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ENTER:
            get_tree().change_scene("res://levels/Ship/Ship.tscn")
