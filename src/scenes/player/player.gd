class_name Player
extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations
@onready var state_machine: Node = $StateMachine
@onready var move_component: Node = $MoveComponent
@onready var get_menu := preload("res://src/scenes/hud/menu_overlay.tscn")

@export var move_speed: float

var menu_opened: bool = false

func _ready() -> void:
	add_to_group("Player")
	state_machine.init(self, animations, move_component, move_speed)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_menu"):
		toggle_menu()
	else:
		state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func toggle_menu():
	if !menu_opened:
		add_child(get_menu.instantiate())
		menu_opened = true
		get_tree().paused = true
	else:
		# Unpausing the game is done in the menu overlay script itself
		# since the player entity is paused alongside the rest of the game
		var menu_overlay = get_node("MenuOverlay")
		if menu_overlay:
			menu_overlay.queue_free()
		menu_opened = false
