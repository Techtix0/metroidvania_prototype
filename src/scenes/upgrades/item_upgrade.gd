extends Area2D

@export var item_name: String
@export var item_texture: Texture2D
@export var get_amount: int

func _ready() -> void:
	$ItemSprite.texture = item_texture

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		PlayerManager.inventory["Sword"] = true
		PlayerManager.announce_sword_upgrade()
		queue_free()
