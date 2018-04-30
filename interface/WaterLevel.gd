extends Node2D

var level = 1.0

var Bubbles = [
	preload("res://interface/BigBubble.tscn"),
	preload("res://interface/SmallBubble.tscn"),
]

func _ready():
	pass

func emit_bubble():
	var bubble = Bubbles[randi()%Bubbles.size()].instance()
	
	bubble.translate(Vector2(0, -4))
	
	add_child(bubble)

func _process(delta):
	var p = ($Background.texture.get_size().y-8)*level
	
	$Waterline.position.y = -p-2
	$Water.position.y = -p-1
	$Water.scale.y = p/3-0.6
	
	if level > 0:
		if randi()%int(level*60+1) == 0:
			emit_bubble()
		level -= delta*0.01
	
	var static_generator = get_tree().get_root().find_node("Static", true, false).find_node("Overlay")
	
	if static_generator:
		static_generator.intensity = 1-level