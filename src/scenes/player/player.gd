class_name Player
extends CharacterBody2D

@onready var animations: AnimatedSprite2D = $Animations
@onready var state_machine: Node = $StateMachine
@onready var move_component: Node = $MoveComponent

@export var move_speed: float

func _ready() -> void:
	add_to_group("Player")
	state_machine.init(self, animations, move_component, move_speed)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
