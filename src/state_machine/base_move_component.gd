class_name MoveComponent
extends Node

@export var jump_force: float 
@export var has_variable_jump: bool
@export var jump_buffer: float
@export var fall_multiplier: float
@export var move_speed: float
@export var coyote_time: float
var coyote_timer: float

# Return the desired direction of movement for the character
# in range [-1, 1], where positive values indicate a desire
# to move to the right and negative values to the left.
#
# This should return a float but since GDscript doesn't 
# doesn't support interfaces yet i can't put the return value
# in this class
func get_movement_direction():
	pass
	
# Return a boolean indicating if the character wants to jump.
# This function does not decide if the entity actually can jump.
func wants_jump(): 
	pass

# Returns a boolean indicating if the character wants to keep jumping. 
# Mostly designed for use with variable jump height.
func wants_keep_jumping():
	pass
	
# TODO: move to attack component
# This should return a bool but since GDscript doesn't 
# doesn't support interfaces yet i can't put the return value
# in this class
func wants_attack():
	pass
