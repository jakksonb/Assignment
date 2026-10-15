extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Score.add_point(250)
		collision_layer = 0
		collision_mask = 0
		queue_free()
