extends Sprite

func action():
	$"AnimationPlayer".play()

func _on_Area2D_area_entered(area):
	if area == $"../Player/RadarAreaD2":
		$"../Player/HUD/RichTextLabel".newline()
		$"../Player/HUD/RichTextLabel".add_text("You're getting closer to  (elevator) ...")
	elif area == $"../Player/PlayerArea2D":
		$"../Player/HUD/RichTextLabel".newline()
		$"../Player/HUD/RichTextLabel".add_text("You're in the elevator")
		$"../Player/HUD/RichTextLabel".newline()
		$"../Player/HUD/RichTextLabel".add_text("Use?")
	pass # replace with function body
