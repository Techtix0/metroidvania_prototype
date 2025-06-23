extends CanvasLayer
		
func _ready() -> void:
	if PlayerManager.inventory["Sword"]:
		%WeaponType.text = "Sword" 
	else:
		PlayerManager.obtain_sword.connect(update_weapon_text)
	
	%HealthAmount.text = str(PlayerManager.current_health)
	PlayerManager.took_damage.connect(update_health)
	
func update_weapon_text() -> void:
	%WeaponType.text = "Sword"

func update_health() -> void:
	%HealthAmount.text = str(PlayerManager.current_health)

func update_speed(speed: Vector2) -> void:
	%Speed.text = str(speed)
