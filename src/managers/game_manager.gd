extends Node

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
# TODO: Call this function from the main menu
func start_game() -> void:
	SceneManager.transition_to_scene("Level01")
