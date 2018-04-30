extends Sprite

onready var hud = $"../../Player/HUD/Top/Panel/RichTextLabel"
export (bool) var up 
export (bool) var down 

func up():
	$"../../Player".global_position.y -= 86

func down():
	$"../../Player".global_position.y += 86

func _on_Area2D_area_entered(area):
	if area == $"../../Player/RadarAreaD2":
		hud.newline()
		hud.add_text("You're getting closer to  (elevator) ...")
	elif area == $"../../Player/PlayerArea2D":
		hud.newline()
		$"../../Player".move("stop")
		hud.add_text("You're in the elevator")
		hud.newline()
		hud.add_text("type up or down to to be teleported")
		if up == true:
			hud.connect("up",self,"up")
		if down == true:
			hud.connect("down",self,"down")
	pass 

func _on_Area2D_area_exited(area):
	if hud.is_connected("up",self,"up"):
		hud.disconnect("up",self,"up")
	if hud.is_connected("down",self,"down"):
		hud.disconnect("down",self,"down")
	pass 