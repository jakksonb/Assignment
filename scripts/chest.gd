extends Area2D

@onready var Sprite = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Sprite.play("open")
