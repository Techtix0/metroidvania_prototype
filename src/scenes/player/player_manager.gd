extends Node

signal obtain_sword

var inventory: Dictionary = {"Sword" : false}
var player_position: Vector2
var move_speed: float = 180.0

func _ready() -> void:
	player_position = Vector2(32, 280)

func announce_sword_upgrade() -> void:
	emit_signal("obtain_sword")
