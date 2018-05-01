extends KinematicBody2D

signal teleport
signal open
signal hiden

const GRAVITY = 1
const SPEED = 50

var prev_frame = 0
var motion = Vector2()
const up = Vector2(0,-1)
	
func _physics_process(delta):
	sound()
	motion.y += GRAVITY 
	motion = move_and_slide(motion,up)

func move(direction):
	match direction:
		"left":
			motion.x = -SPEED
			$Animations.play("Walk Left")
		"right":
			motion.x = SPEED
			$Animations.play("Walk Right")
		"stop":
			motion.x = 0
			$Animations.stop()
		"teleport":
			emit_signal("teleport")
		"open":
			emit_signal("open")
		"hide":
			emit_signal("hiden")

func sound():
		if prev_frame != $icon.frame:
			if $icon.frame == 2:
				$r_foot.play()
			if $icon.frame == 5:
				$l_foot.play()
			prev_frame = $icon.frame