extends Sprite

onready var hud = $"../../Player/HUD/Top/Panel/RichTextLabel"

func _on_Area2D_area_entered(area):
	if area == $"../../Player/RadarAreaD2":
		hud.newline()
		hud.add_text("You're getting closer to  (small container) ...")
	elif area == $"../../Player/PlayerArea2D":
		hud.newline()
		$"../../Player".move("stop")
		hud.add_text("You're in front of the small container")
		hud.newline()
		hud.add_text("type open to open the container")
	pass