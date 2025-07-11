class_name MushroomEnemy
extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations
@onready var state_machine: Node = $StateMachine
@onready var move_component: Node = %EnemyMoveComponent

@export var move_direction: float = 1.0
@export var move_speed: float

func _ready() -> void:
	state_machine.init(self, animations, move_component)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		PlayerManager.take_damage(10)
