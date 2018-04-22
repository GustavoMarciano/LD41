extends Sprite

var speed = Vector2(0, 0)

func _ready():
	pass

func _process(delta):
	self.translate(speed*delta)
	var screen_size = get_viewport().get_visible_rect().size
	
	if self.position.x < 0:
		self.position.x += screen_size.x
	if self.position.y < 0:
		self.position.y += screen_size.y
	if self.position.x > screen_size.x:
		self.position.x -= screen_size.x
	if self.position.y > screen_size.y:
		self.position.y -= screen_size.y