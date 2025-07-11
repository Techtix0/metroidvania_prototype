class_name Player
extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations
@onready var state_machine: Node = $StateMachine
@onready var move_component: Node = %PlayerMoveComponent

func _ready() -> void:
	add_to_group("Player")
	state_machine.init(self, animations, move_component)
	PlayerManager.link_player(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	if move_component.dash_cooldown_timer > 0:
		move_component.dash_cooldown_timer -= delta

	state_machine.process_physics(delta)

	# Debug purposes
	# TODO: delete
	%HUD.update_speed(self.velocity)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
