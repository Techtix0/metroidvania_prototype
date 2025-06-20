extends CanvasLayer

#func _physics_process(_delta: float) -> void:
	#if PlayerManager.inventory["Sword"] == true:
		#%WeaponType.text = "Sword"
		
func _ready() -> void:
	if PlayerManager.inventory["Sword"]:
		%WeaponType.text = "Sword" 
	else:
		PlayerManager.obtain_sword.connect(update_weapon_text)
		

func update_weapon_text() -> void:
	%WeaponType.text = "Sword"
