extends Sprite

onready var hud = $"../../Player/HUD/Top/Panel/RichTextLabel"

func open():
	$AnimationPlayer.play("SmallContainer")
	pass

func _on_Area2D_area_entered(area):
	if area == $"../../Player/Radar2D":
		_on_radar_entered()
	if area == $"../../Player/PlayerArea2D":
		_on_player_entered()
		var obj = area.get_owner()
		obj.move("stop")
		obj.connect("open",self,"open")
	pass

func _on_Area2D_area_exited(area):
	var obj = area.get_owner()
	if area == $"../../Player/PlayerArea2D":
		_on_player_exit()
		obj.disconnect("open",self,"open")
		$AnimationPlayer.play_backwards("SmallContainer")
	pass 

func _on_radar_entered():
	hud.newline()
	hud.add_text("You're getting closer to  (SmallContainer) ...")
	pass
func _on_player_entered():
	hud.newline()
	hud.add_text("You are in front of the (SmallContainer)")
	hud.newline()
	hud.add_text("Type open to open the (SmallContainer)")
	pass
func _on_player_exit():
	hud.newline()
	hud.add_text("leaving (SmallContainer)")
	pass