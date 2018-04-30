extends Area2D

func _ready():
	pass

func _unhandled_input(event):
    if event is InputEventMouseButton:
        if event.pressed and event.button_index == BUTTON_LEFT:
            get_tree().change_scene("res://title/Credits.tscn")