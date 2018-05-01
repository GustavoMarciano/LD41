extends Sprite

export (PoolStringArray) var drops 

func open():
	$AnimationPlayer.play("BigContainer")
	pass

func _on_Area2D_area_entered(area):
	if area == $"../../Player/PlayerArea2D":
		var obj = area.get_owner()
		obj.move("stop")
		obj.connect("open",self,"open")
	pass
	
func _on_Area2D_area_exited(area):
	var obj = area.get_owner()
	if area == $"../../Player/PlayerArea2D":
		obj.disconnect("open",self,"open")
		$AnimationPlayer.play_backwards("BigContainer")
	pass 
	
