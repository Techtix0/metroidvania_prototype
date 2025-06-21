extends State

@export var idle_state: State
@export var move_state: State
@export var jump_state: State

@export var jump_buffer: float

var jump_buffer_timer: float

func enter() -> void:
	jump_buffer_timer = 0.0
	animation_name = "fall"
	super()
	
func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = jump_buffer
	return null

func process_physics(delta: float) -> State:
	jump_buffer_timer -= delta
	
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
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
