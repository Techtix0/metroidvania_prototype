extends Node

signal obtain_sword
signal took_damage

var inventory: Dictionary = {"Sword" : false}

var player_position: Vector2
var move_speed: float = 180.0
var came_through_door: bool = false

var max_health: int = 100
var current_health: int = max_health

func _ready() -> void:
	player_position = Vector2(32, 280)

func announce_sword_upgrade() -> void:
	emit_signal("obtain_sword")

func take_damage(amount: int) -> void:
	current_health -= amount
	emit_signal("took_damage")
