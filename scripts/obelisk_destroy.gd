extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("destroy")
		queue_free()
		
