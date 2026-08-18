extends CharacterBody2D

#variables and declarations
var end_ladder = Vector2(345, 9)
var has_sword = false
var attacking = false
const movespeed = 300
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

	# Movement
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
			if velocity.y < 0:
				jump_sound.play()
				anim.animation = "jump"
			else:
				anim.animation = "fall"

		elif abs(velocity.x) > 0:
			anim.animation = "run"

		else:
			anim.animation = "idle"
			
	
		
	else:
		if not is_on_floor():
			if velocity.y < 0:
				anim.animation = "jump_sword"
			else:
				anim.animation = "fall_sword"

		elif abs(velocity.x) > 0:
			anim.animation = "run_sword"

		else:
			anim.animation = "idle_sword"

	if anim.animation == "run" and Input.is_action_pressed("sprint"):
		SPEED = movespeed
	else:
		SPEED = MvSpdDefault

	if position.y > 900:
		position = start_position

	if Input.is_action_pressed("attack") and has_sword:
			attacking = true
			
func teleport():
	position = end_ladder 
	
#handles respawn
func respawn():
	position = start_position
	get_tree().reload_current_scene()
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if attacking:
		attacking = false
