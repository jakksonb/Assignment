extends CharacterBody2D
class_name player

#variables and declarations
var double_jump = false
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
const JUMP_VELOCITY = -300
const jumppad_velocity = -450
var health = 100
var stamina = 100
const max_stamina = 100
const min_stamina = 0
var jump_count = 0
var max_jumps = 2

func _physics_process(delta: float) -> void:
	#handles gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		jump_count = 0
		double_jump = false
	
	if Input.is_action_just_pressed("jump") and jump_count < max_jumps:
		velocity.y = JUMP_VELOCITY
		jump_count += 1
	
		
		
	if jump_count == 2 and not double_jump and stamina >= 50:
		stamina -= 50.5
		double_jump = true
		print(stamina)
		
	if stamina <= 0:
		double_jump = false
		
		
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
func sprintyes():
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
	
func up():
	velocity.y = jumppad_velocity
	
func sprintno():
	SPEED = MvSpdDefault
	
	

func _process(delta):
	if Input.is_action_pressed("sprint") and stamina >= min_stamina:
		stamina -= 0.5
		print(stamina)
		
	if not Input.is_action_pressed("sprint") and stamina < max_stamina and is_on_floor():
		stamina += 0.5
	
	if stamina < min_stamina:
		stamina = min_stamina
	
	if stamina > 0:
		sprintyes()
	elif stamina <= 0:
		sprintno()
		
		
		
	
	

		
		
