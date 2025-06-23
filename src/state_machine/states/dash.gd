extends State

# @export var move_state: State
@export var fall_state: State

var dash_timer: float
var movement: float
var total_frames: int

func enter() -> void:
	animation_name = "dash"
	# Stopping animation since the frames will be manually set during the dash based on the dash_time
	parent.animations.stop()

	parent.velocity = Vector2(0, 0)
	dash_timer = move_component.dash_time

	total_frames = parent.animations.sprite_frames.get_frame_count(animation_name)

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
	# Setting the frame of the animation based on the progress in the dash timer
	parent.animations.frame = round(total_frames / (move_component.dash_time / dash_timer))

	if dash_timer > 0:
		dash_timer -= delta
		parent.animations.flip_h = movement < 0
		parent.velocity.x += movement 
		parent.move_and_slide()
	else:
		return fall_state

	return null
