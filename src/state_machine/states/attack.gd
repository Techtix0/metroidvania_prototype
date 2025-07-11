extends State

@export var idle_state: State
var is_animation_done: bool

func enter() -> void:
	is_animation_done = false
	animation_name = "attack"
	super()
	await animations.animation_finished
	is_animation_done = true

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> State:
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	if is_animation_done:
		return idle_state
	return null
