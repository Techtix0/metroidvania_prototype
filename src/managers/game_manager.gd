extends Node

@onready var get_menu := preload("res://src/scenes/hud/pause_menu/menu_overlay.tscn")
var menu_opened: bool

func _ready() -> void:
	menu_opened = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_menu"):
		toggle_menu()
	
# TODO: Call this function from the main menu
func start_game() -> void:
	SceneManager.transition_to_scene("Level01")
	
func toggle_menu():
	if !menu_opened:
		add_child(get_menu.instantiate())
		menu_opened = true
		get_tree().paused = true
	else:
		# Unpausing the game is done in the menu overlay script itself
		# since the player entity is paused alongside the rest of the game
		var menu_overlay
		for child in get_children():
			if child is MenuOverlay:
				child.queue_free()
		menu_opened = false
