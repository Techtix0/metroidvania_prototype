extends State

@export var move_state: State
@export var jump_state: State
@export var fall_state: State

func enter() -> void:
	super()
	animation_name = "idle"
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		return move_state
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	return null
	
func process_frame(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
