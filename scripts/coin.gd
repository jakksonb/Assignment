extends Area2D



func _on_body_entered(body: Node) -> void:
	body_entered.connect(_on_body_entered)
	


	if body.is_in_group("player"):
		Score.add_point(1)
		queue_free()

		
