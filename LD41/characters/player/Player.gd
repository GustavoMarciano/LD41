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
			$Animations.play("Walk Left")
			$Steps.play()
		"right":
			dir = right
			$Animations.play("Walk Right")
			$Steps.play()
		"up":
			dir = up
		"down":
			dir = down
		"stop":
			dir = stop
			$Animations.stop()
			$Steps.stop()
	pass