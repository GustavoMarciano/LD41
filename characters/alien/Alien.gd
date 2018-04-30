extends KinematicBody2D

export(float) var speed
var movements = ["right","left","up","down"]
var raycasts = {"right":"RayCast2DRight","left":"RayCast2DLeft"}
const GRAVITY = 1
var motion = Vector2()
const up = Vector2(0,-1)

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
		"up":
			self.global_position.y -= 86
		"down":
			self.global_position.y += 86