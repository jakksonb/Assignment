extends Area2D

@onready var Sprite = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	#also add here something to change the player score
	if body.is_in_group("player"):
		Score.add_point(5)
		Sprite.play("collect",1.0,false)  #replace frame time with a float of the time (seconds) per frame
	if !Sprite.is_playing():  #wait for anim end
		self.queue_free()

		
