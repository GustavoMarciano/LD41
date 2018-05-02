extends Sprite

onready var hud = $"../../Player/HUD/Top/Panel/RichTextLabel"
export (NodePath) var teleport
export(Vector2) var teleport_offset

func find_sprite(node):
	for c in node.get_children():
		if c.get_class() == "Sprite":
			return c

func teleport(object):
	object.global_position = get_node(teleport).global_position+teleport_offset
	object.global_position.y -= find_sprite(object).texture.get_height()/2

func _on_Area2D_area_entered(area):
	if area == $"../../Player/Radar2D":
		_on_radar_entered()
	if area == $"../../Player/PlayerArea2D":
		_on_player_entered()

	if area != $"../../Player/Radar2D":
		var obj = area.get_owner()
		obj.move("stop")
		obj.connect("teleport",self,"teleport",[obj])

func _on_Area2D_area_exited(area):
	if area == $"../../Player/PlayerArea2D":
	 	_on_player_exit()
	var obj = area.get_owner()
	if obj.is_connected("teleport",self,"teleport"):
		obj.disconnect("teleport",self,"teleport")
	pass 

func _on_radar_entered():
	hud.newline()
	hud.add_text("You're getting closer to  (Teleport) ...")
	pass

func _on_player_entered():
	hud.newline()
	hud.add_text("You are in the (Teleport")
	hud.newline()
	hud.add_text("Type teleport to use the (Teleport)")
	pass

func _on_player_exit():
	hud.newline()
	hud.add_text("leaving (Teleport)")
	pass