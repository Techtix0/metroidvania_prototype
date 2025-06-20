extends Node

signal obtain_sword

var inventory: Dictionary = {"Sword" : false}

func announce_sword_upgrade() -> void:
	emit_signal("obtain_sword")
