class_name MoveComponent
extends Node

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
#
# This should return a bool but since GDscript doesn't 
# doesn't support interfaces yet i can't put the return value
# in this class
func wants_jump():
	pass
	
# TODO: move to attack component
# This should return a bool but since GDscript doesn't 
# doesn't support interfaces yet i can't put the return value
# in this class
func wants_attack():
	pass
