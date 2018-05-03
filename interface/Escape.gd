extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			if $Visibility.visible == true:
				$Visibility.visible = false
			else:
				$Visibility.visible = true
		if event.pressed and event.scancode == KEY_UP:
			if $Visibility.visible == true:
				if $Visibility/Menu.frame == 0:
					$Visibility/Menu.frame = 2
				else:
					$Visibility/Menu.frame -= 1
		if event.pressed and event.scancode == KEY_DOWN:
			if $Visibility.visible == true:
				if $Visibility/Menu.frame == 2:
					$Visibility/Menu.frame = 0
				else:
					$Visibility/Menu.frame += 1
		if event.pressed and event.scancode == KEY_ENTER:
			if $Visibility.visible == true:
				if $Visibility/Menu.frame == 0:
					$Visibility.visible = false
				elif $Visibility/Menu.frame == 1:
					get_tree().quit()
				else:
					get_tree().change_scene("res://title/Credits.tscn")