extends MoveComponent

func get_movement_direction() -> float:
	return Input.get_axis("move_left", "move_right")
	
func wants_jump() -> bool:
	return Input.is_action_pressed("jump")

func wants_attack() -> bool:
	if PlayerManager.inventory["Sword"] == true:
		return Input.is_action_just_pressed("attack")
	return false
