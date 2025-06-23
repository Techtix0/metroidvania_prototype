extends Node

signal obtain_sword
signal took_damage

# Player object
var player: Player

# Player inventory
var inventory: Dictionary = {"Sword" : false}

# Player health
var max_health: int = 100
var current_health: int = max_health

# Where to spawn player on next scene load
var player_position: Vector2
var came_through_door: bool = false

func _ready() -> void:
	# Sets initial player position
	player_position = Vector2(32, 280)

# Refresh the link to the player object
func link_player(player: Player) -> void:
	self.player = player

# Emit signal when sword upgrade is picked up by the player
func announce_sword_upgrade() -> void:
	emit_signal("obtain_sword")

# Modify health based on damage taken
func take_damage(amount: int) -> void:
	if current_health > 0:
		current_health -= amount
		emit_signal("took_damage")
