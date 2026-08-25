extends Area2D
const coin_scene = preload("res://prefabs/coin.tscn")
@onready var Sprite = $AnimatedSprite2D
@export var coin_count: int = 5

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Sprite.play("open")
		spawn_coins()
		collision_layer = 0
		collision_mask = 0




func spawn_coins() -> void:	
	for i in range(coin_count):
		var new_coin = coin_scene.instantiate()
		get_parent().call_deferred("add_child", new_coin)
		new_coin.global_position = global_position
		new_coin.global_position.x += randf_range(-30, -10)
		
	
		
