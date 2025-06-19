class_name MoveInterface
extends Node

# Return the desired direction of movement for the character
# in range [-1, 1], where positive values indicate a desire
# to move to the right and negative values to the left.
func get_movement_direction() -> float:
	return 0.0
	
# Return a boolean indicating if the character wants to jump.
# This function does not decide if the entity actually can jump.
func wants_jump() -> bool:
	return false
