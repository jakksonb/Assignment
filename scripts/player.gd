extends CharacterBody2D

#variables and declarations
var end_ladder = Vector2(345, 9)
var has_sword = false
var attacking = false
const movespeedsprint = 300
const MvSpdDefault = 225
@onready var anim = $AnimatedSprite2D
@onready var jump_sound = $AudioStreamPlayer
@onready var jump_land = $AudioStreamPlayer2
var start_position = Vector2(464, 525)
var SPEED = 225.0
const JUMP_VELOCITY = -299.0

func _physics_process(delta: float) -> void:
	#handles gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	#handles player jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# handles movement
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	#this flips the player sprite when moving left or right
	if direction != 0:
		anim.scale.x = direction

	move_and_slide()

 #this handles animation of the player when moving a direction
	if not has_sword:
		if not is_on_floor():
			if velocity.y > 0:
				anim.animation = "jump"
				jump_sound.play()
			else:
				anim.animation = "fall"

		elif abs(velocity.x) > 0:
			anim.animation = "run"

		else:
			anim.animation = "idle"
			
	
	#handles the animation if player has a sword
	else:
		if not is_on_floor():
			if velocity.y < 0:
				anim.animation = "jump_sword"
				jump_sound.play()
			else:
				anim.animation = "fall_sword"

		elif abs(velocity.x) > 0:
			anim.animation = "run_sword"

		else:
			anim.animation = "idle_sword"
			
	
	#this adds a sprint mechanic to the player
	if (anim.animation == "run" or anim.animation == "run_sword") and Input.is_action_pressed("sprint"):
		SPEED = movespeedsprint
	else:
		SPEED = MvSpdDefault

	#makes a pos for a respawn of the player
	if position.y > 900:
		position = start_position

	if Input.is_action_pressed("attack") and has_sword:
			attacking = true
			
	if attacking:
		anim.animation = "attack"
		
#teleport func for when player hits a ladder
func teleport():
	position = end_ladder 
	
#handles respawn
func respawn():
	position = start_position
	get_tree().reload_current_scene()
	



	
		
		
