extends State

@export var fall_state: State
@export var move_state: State

@export var jump_force: float = 300.0

func enter() -> void:
	animation_name = "jump"
	parent.velocity.y = -jump_force
	super()

func process_input(_event: InputEvent) -> State:
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis("move_left", "move_right") * move_speed

	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor() and movement != 0:
		return move_state
	return null
	
