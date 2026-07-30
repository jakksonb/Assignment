extends Area2D



func _on_body_entered(body: Node2D) -> void:
	$AnimationPlayer.play("collect")

	if body.is_in_group("player"):
		Score.add_point(5)
		queue_free()
		
