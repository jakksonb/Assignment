extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

var start_position = Vector2(464, 525)
const SPEED = 225.0
const JUMP_VELOCITY = -299.0

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Flip sprite
	if direction != 0:
		anim.scale.x = direction

	move_and_slide()

 
	if not is_on_floor():
		if velocity.y < 0:
			anim.animation = "jump"
		else:
			anim.animation = "fall"

	elif abs(velocity.x) > 0:
		anim.animation = "run"

	else:
		anim.animation = "idle"



	if position.y > 900:
		position = start_position


func respawn():
	position = start_position
	
