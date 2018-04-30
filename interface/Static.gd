extends Panel

var t = 0.0
var intensity = 0.1

func _ready():
	pass

func _process(delta):
	t += delta
	
	var screen_size = get_viewport().get_visible_rect().size
	get_material().set_shader_param("t", t)
	get_material().set_shader_param("d", delta)
	get_material().set_shader_param("screen_w", screen_size.x)
	get_material().set_shader_param("screen_h", screen_size.y)
	get_material().set_shader_param("intensity", intensity)