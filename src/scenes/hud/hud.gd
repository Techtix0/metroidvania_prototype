extends CanvasLayer

func _physics_process(delta: float) -> void:
	if PlayerManager.inventory["Sword"] == true:
		%WeaponType.text = "Sword"
