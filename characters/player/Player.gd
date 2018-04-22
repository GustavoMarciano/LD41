extends KinematicBody2D

var prev_frame = 0

var dir= Vector2()
var walk = Vector2()

var left = Vector2(-1,0)
var right = Vector2(1,0)
var up = Vector2(0,-1)
var down = Vector2(0,1)
var stop = Vector2(0,0)

func _ready():
	pass
	
func _physics_process(delta):
	if prev_frame != $icon.frame:
		if $icon.frame == 2:
			$r_foot.play()
		if $icon.frame == 5:
			$l_foot.play()
		prev_frame = $icon.frame

	walk = dir * 50
	walk = move_and_slide(walk,up)
	position.y += 1 


func move(direction):
	match direction:
		"left":
			dir = left
			$Animations.play("Walk Left")
		"right":
			dir = right
			$Animations.play("Walk Right")
		"up":
			dir = up
		"down":
			dir = down
		"stop":
			dir = stop
			$Animations.stop()
