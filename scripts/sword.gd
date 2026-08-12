extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if is_in_group("player"):
		body.has_sword()
		
