extends Node2D

var HideAbility = 1 #1 for able, 0 for not able
onready var hud = $"../../Player/HUD/Top/Panel/RichTextLabel"

func _ready():
	pass

func _on_AnimationPlayer_animation_started(HideMeter):
	HideAbility = 0
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	HideAbility = 1
	pass
	
func hide():
	if HideAbility == 0:
		pass
	if HideAbility == 1:
		$MeterLine/AnimationPlayer.play("HideMeter")

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ALT:
			if HideAbility == 0:
				pass
			if HideAbility == 1:
				$MeterLine/AnimationPlayer.play("HideMeter")