extends Area2D

export(float) var SPEED = 50.0

enum STATES { IDLE, FOLLOW }
var _state = null

var path = []
var target_point_world = Vector2()
var target_position = Vector2()

var velocity = Vector2()

func _ready():
	_change_state(IDLE)


func _change_state(new_state):
	if new_state == FOLLOW:
		path = get_parent().get_node('TileMap').get_path(position, target_position)
		if not path or len(path) == 1:
			_change_state(IDLE)
			return
		# The index 0 is the starting cell
		# we don't want the character to move back to it in this example
		target_point_world = path[1]
	_state = new_state


func _process(delta):
	target_position = $"../Elevator".position
	_change_state(FOLLOW)
	if not _state == FOLLOW:
		return
	var arrived_to_next_point = move_to(target_point_world)
	if arrived_to_next_point:
		path.remove(0)
		if len(path) == 0:
			_change_state(IDLE)
			return
		target_point_world = path[0]


func move_to(world_position):
	var MASS = 01.0
	var ARRIVE_DISTANCE = 10.0

	var desired_velocity = (world_position - position).normalized() * SPEED
	var steering = desired_velocity - velocity
	velocity += steering / MASS
	position += velocity * get_process_delta_time()
	return position.distance_to(world_position) < ARRIVE_DISTANCE


