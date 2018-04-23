extends Sprite

onready var hud = $"../Player/HUD/Top/Panel/RichTextLabel"
var used = false

func test():
	if used == false:
		hud.is_interacting = true
		$"AnimationPlayer".play("move")
		used = true
	else:
		hud.is_interacting = true
		$"AnimationPlayer".play_backwards("move")
		used = false

func _on_Area2D_area_entered(area):

	hud.connect("action",self,"test")
	if area == $"../Player/RadarAreaD2":
		hud.newline()
		hud.add_text("You're getting closer to  (elevator) ...")
	elif area == $"../Player/PlayerArea2D":
		hud.newline()
		$"../Player".move("stop")
		hud.add_text("You're in the elevator")
		hud.newline()
		hud.add_text("Use?")
	pass # replace with function body


func _on_AnimationPlayer_animation_finished(anim_name):
	hud.is_interacting = false
	pass # replace with function body


func _on_Area2D_area_exited(area):
	hud.disconnect("action",self,"test")
	pass # replace with function body 