extends KinematicBody2D

const GRAVITY = 98

var left = Vector2(-1, 0)
var right = Vector2(1, 0)
export(float) var speed

func _ready():
	$Animations.play("Walk Right")

func move(dir):
	move_and_slide(dir)

func _process(delta):
	move(right*speed)
	move_and_slide(Vector2(0, GRAVITY))