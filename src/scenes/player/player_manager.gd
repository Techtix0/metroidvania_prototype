extends Node

signal obtain_sword
signal took_damage

var coyote_time: float = 0.1
var coyote_timer: float

var inventory: Dictionary = {"Sword" : false}

var player_position: Vector2
var move_speed: float = 180.0
var came_through_door: bool = false

var max_health: int = 100
var current_health: int = max_health

func _ready() -> void:
	player_position = Vector2(32, 280)
	coyote_timer = coyote_time

func _physics_process(delta: float) -> void:
	if coyote_timer > 0:
		coyote_timer -= delta
	

func announce_sword_upgrade() -> void:
	emit_signal("obtain_sword")

func take_damage(amount: int) -> void:
	if current_health > 0:
		current_health -= amount
		emit_signal("took_damage")
