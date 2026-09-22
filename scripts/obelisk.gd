extends Area2D
@onready var player = get_node("../Player")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$AnimatedSprite2D.play("activated")
	
		collision_layer = 0
		collision_mask = 0
		body.health = 100
	
