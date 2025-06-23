extends State

@export var fall_state: State
@export var move_state: State
@export var dash_state: State

func enter() -> void:
	animation_name = "jump"
	parent.velocity.y = -move_component.jump_force
	super()

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	if move_component.wants_dash():
		return dash_state

	parent.velocity.y += gravity * delta

	if parent.velocity.y > 0:
		return fall_state

	if move_component.has_variable_jump && !move_component.wants_keep_jumping():
		return fall_state
	
	var movement = move_component.get_movement_direction() * move_component.move_speed

	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor() and movement != 0:
		return move_state
	return null
	
