extends Node

func _ready() -> void:
	pass
	
# TODO: Call this function from the main menu
func start_game() -> void:
	SceneManager.transition_to_scene("Level01")
