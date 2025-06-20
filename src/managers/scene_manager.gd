extends Node

var scenes: Dictionary = {"Level01": "res://src/scenes/levels/level_01.tscn",
						  "Level02": "res://src/scenes/levels/Level02.tscn"}

func transition_to_scene(level: String) -> void:
	var scene_path: String = scenes.get(level)
	
	if scene_path:
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file(scene_path)
