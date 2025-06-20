extends StaticBody2D

@export var next_scene: String


func _on_exit_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var player: Player = body
		player.queue_free()
		
	await get_tree().create_timer(0.5).timeout
	SceneManager.transition_to_scene(next_scene)
