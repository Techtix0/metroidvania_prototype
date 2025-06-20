extends StaticBody2D

signal door_used

@export var next_scene: String
var portal_spawn: Vector2

func _ready() -> void:
	portal_spawn = %PlayerSpawn.global_position
	PlayerManager.player_position = portal_spawn

func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var player: Player = body
		player.queue_free()
		emit_signal("door_used")
		
	await get_tree().create_timer(0.5).timeout
	SceneManager.transition_to_scene(next_scene)
