extends Node2D

var HideAbility = 1 #1 for able, 0 for not able

func _ready():
	pass

func _on_AnimationPlayer_animation_started(HideMeter):
	HideAbility = 0
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	HideAbility = 1
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ALT:
			if HideAbility == 0:
				pass
			if HideAbility == 1:
				$MeterLine/AnimationPlayer.play("HideMeter")