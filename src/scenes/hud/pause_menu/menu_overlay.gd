extends CanvasLayer

func _unhandled_input(_vent: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_menu") and get_tree().paused and get_parent().menu_opened:
		get_tree().paused = false
