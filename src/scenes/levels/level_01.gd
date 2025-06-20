extends Node2D

@onready var sword_upgrade_spawn: Marker2D = %SwordUpgradeSpawn
@onready var sword_upgrade_preload := preload("res://src/scenes/objects/upgrades/item_upgrade.tscn")
@onready var player: Player = $Player

func _ready() -> void:
	player.global_position = PlayerManager.player_position
	
	if !PlayerManager.inventory["Sword"]:
		# Getting the sword texture
		var sword_texture = AtlasTexture.new()
		sword_texture.atlas = load("res://assets/village-props/TX Village Props.png")
		sword_texture.region = Rect2(352.0, 69.0, 36.0, 9.0)
		
		# Adding the item_upgrade scene to the level and assigning the correct variables
		var sword_upgrade = sword_upgrade_preload.instantiate()
		sword_upgrade.item_name = "Sword"
		sword_upgrade.item_texture = sword_texture
		sword_upgrade.sprite_rotation = 3 * PI/2 # This is in radians
		sword_upgrade.global_position = sword_upgrade_spawn.global_position
		add_child(sword_upgrade)	
	
