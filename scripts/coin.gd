extends Area2D


signal item_collected


func _onready() -> void:
	body_entered.connect(_on_body_entered)



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		item_collected.emit
		queue_free
		
	
	
