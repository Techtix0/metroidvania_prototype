extends State

@export var move_state: State
@export var jump_state: State
@export var fall_state: State
@export var attack_state: State

func enter() -> void:
	animation_name = "idle"
	parent.velocity.x = 0
	super()

func process_input(event: InputEvent) -> State:
	if move_component.get_movement_direction() != 0: 
		return move_state
	if move_component.wants_jump() and parent.is_on_floor():
		return jump_state
	if move_component.wants_attack():
		return attack_state
	return null
	
func process_frame(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
