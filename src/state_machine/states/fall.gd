extends State

@export var idle_state: State
@export var move_state: State
@export var jump_state: State
@export var dash_state: State

var jump_buffer_timer: float

func enter() -> void:
	parent.velocity.y = 0
	jump_buffer_timer = 0.0
	animation_name = "fall"
	super()
	
func process_input(_event: InputEvent) -> State:
	if move_component.wants_jump():
		if move_component.coyote_timer > 0:
			move_component.coyote_timer = 0
			return jump_state
		jump_buffer_timer = move_component.jump_buffer
	return null

func process_physics(delta: float) -> State:
	if move_component.wants_dash():
		return dash_state

	jump_buffer_timer -= delta
	move_component.coyote_timer -= delta
	
	if parent.velocity.y <= move_component.terminal_velocity:
		parent.velocity.y += move_component.fall_multiplier * gravity * delta

	var movement = move_component.get_movement_direction() * move_component.move_speed
	
	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if jump_buffer_timer > 0:
			return jump_state
		if movement != 0:
			return move_state
		return idle_state
	return null
