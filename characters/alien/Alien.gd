extends KinematicBody2D

signal teleport

export(float) var speed

const up = Vector2(0,-1)
const GRAVITY = 1

var motion = Vector2()
var movements = ["right","left","teleport"]
var raycasts = {"right":"RayCast2DRight","left":"RayCast2DLeft"}

func _ready():
	move("right")
	pass

func _physics_process(delta):
	motion.y += GRAVITY 
	motion = move_and_slide(motion,up)
	if get_node(raycasts["right"]).is_colliding():
		move(movements[1])
	elif get_node(raycasts["left"]).is_colliding():
		move(movements[0])
	pass

func move(direction):
	match direction:
		"left":
			motion.x = -speed
			$Animations.play("Walk Left")
		"right":
			motion.x = speed
			$Animations.play("Walk Right")
		"stop":
			motion.x = 0
			$Animations.stop()
		"teleport":
			emit_signal("teleport")

func _on_Area2D_area_entered(area):
	randomize()
	var x = rand_range(0,movements.size())
	move(movements[x])
	pass
