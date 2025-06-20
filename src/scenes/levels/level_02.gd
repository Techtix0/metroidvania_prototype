extends Node2D

@onready var player: Player = $Player

func _ready() -> void:
	if PlayerManager.came_through_door:
		player.global_position = PlayerManager.player_position
		PlayerManager.came_through_door = false
	else:
		player.global_position = Vector2(432, 32)
	
func _on_door_level_01_door_used() -> void:
	PlayerManager.came_through_door = true
