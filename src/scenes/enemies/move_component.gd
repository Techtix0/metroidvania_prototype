extends Node

@export var parent: CharacterBody2D
@onready var obstacle_detector: RayCast2D = %ObstacleDetector

var direction: float

func _ready() -> void:
	direction = parent.move_direction
	

# When a wall is touched, move in the opposite direction
func get_movement_direction() -> float:
	if obstacle_detector.is_colliding():
		direction *= -1
	obstacle_detector.global_position = Vector2(parent.global_position.x, parent.global_position.y + 17)
	obstacle_detector.target_position = Vector2(30 * direction, 0)
	return direction

# This enemy can't jump
func wants_jump() -> bool:
	return false

# TODO: implement attack
func wants_attack() -> bool:
	return false
