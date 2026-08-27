extends Area2D

@onready var Sprite = $AnimatedSprite2D
@onready var coin_collect = $AudioStreamPlayer

	
func _on_body_entered(body: Node2D) -> void:
	#also add here something to change the player score
	if body.is_in_group("player"):
		collision_layer = 0
		collision_mask = 0
		$CollisionShape2D.disabled = true
		Score.add_point(1)
		coin_collect.play()
		Sprite.play("collect",1.0,false)
		print(Sprite.animation)
		

		  #replace frame time with a float of the time (seconds) per frame




func _on_animated_sprite_2d_animation_finished() -> void:
	if Sprite.animation == "collect":
		queue_free()
		
		
		
		



	
