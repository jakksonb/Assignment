extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("destroy")
		collision_layer = 0
		collision_mask = 0
		
