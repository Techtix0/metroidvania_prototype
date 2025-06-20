extends Node

signal obtain_sword

var inventory: Dictionary = {"Sword" : false}
var move_speed: float = 180.0

func announce_sword_upgrade() -> void:
	emit_signal("obtain_sword")
