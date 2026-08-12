extends CharacterBody2D

var movespeed = 35

func _physics_process(delta: float) -> void:
	velocity.x = movespeed
	move_and_slide()
	
	if is_on_wall():
		movespeed = -movespeed
		
	if movespeed > 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
		

	
