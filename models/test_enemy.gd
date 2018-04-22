extends "res://characters/default_character/Movement.gd"

signal action

var target = null


func _ready():
	$"Status".set_state("IDLE")
	$"Status".set_speed("=",100)
	$"Status".set_total_hp("=",200)
	$"Status".set_hp("=",200)
	pass

func _physics_process(delta):
	
	if $"Status".get_hp() == 0:
		$"Status".set_state("DEATH")
	
	match $"Status".get_state():
		"IDLE":
				_on_Vision_area()
				motion = direction * 0 
				if $"Status".get_target()!=null:
					$"Status".set_state("CHASING")
		"CHASING":
			if weakref($"Status".get_target()).get_ref() && $"Status".get_target().get_node("Status").get_side() != $"Status".get_side():
				if (self.global_position.distance_to($"Status".get_target().global_position)>16):
					direction = ($"Status".get_target().global_position - self.global_position).normalized()
					motion = direction * $"Status".get_speed()
				else:
					motion = direction * 0 
			else:
				 $"Status".set_state("CHASING")
		"DEATH":
			queue_free()
		"STUN":
			print("hello")
	pass


func _on_ChaseTimer_timeout():
	#$"Status".set_speed("*",2)
	pass 
	

func _on_Vision_area():
	var bodys = $"Vision".get_overlapping_bodies()

	for body in bodys:
		if body.has_node("Status") && body.get_node("Status").get_side() != $"Status".get_side():
			$"Status".set_target(body)
	pass 