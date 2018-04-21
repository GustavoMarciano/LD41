extends KinematicBody2D

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

	walk = dir * 50
	walk = move_and_slide(walk,up)
	position.y += 1 


func move(direction):
	match direction:
		"left":
			dir = left
			$"icon".flip_h = true
		"right":
			dir = right
			$"icon".flip_h = false
		"up":
			dir = up
		"down":
			dir = down
		"stop":
			dir = stop
	pass