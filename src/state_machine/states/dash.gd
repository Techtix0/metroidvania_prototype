extends State

# @export var move_state: State
@export var fall_state: State

var dash_timer: float
var movement: float

func enter() -> void:
	animation_name = "idle"
	parent.velocity = Vector2(0, 0)
	dash_timer = move_component.dash_time

	movement = ceil(move_component.get_movement_direction()) * move_component.dash_speed 
	if movement == 0:
		if parent.animations.flip_h:
			movement = -1 * move_component.dash_speed
		else:
			movement = move_component.dash_speed

	super()

func exit() -> void:
	pass

func process_physics(delta: float) -> State:
	if dash_timer > 0:
		dash_timer -= delta
		parent.animations.flip_h = movement < 0
		parent.velocity.x += movement 
		parent.move_and_slide()
	else:
		return fall_state

	return null
