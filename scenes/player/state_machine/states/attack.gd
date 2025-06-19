extends State

@export var idle_state: State
var is_animation_done: bool

func enter() -> void:
	animation_name = "attack"
	is_animation_done = true
	super()

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	if !is_animation_done:
		return idle_state
	return null

func _on_animations_animation_finished() -> void:
	is_animation_done = false
