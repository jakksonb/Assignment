extends Control

@onready var player = $"../../"
@onready var stamina = $stamina
@onready var health = $health

#stamina and health
func _process(delta: float) -> void:
	if player.stamina == 100:
		stamina.frame = 0
	elif player.stamina == 75:
		stamina.frame = 1
	elif player.stamina == 50:
		stamina.frame = 2
	elif player.stamina == 25:
		stamina.frame = 3
	elif player.stamina == 0:
		stamina.frame = 4
		
	if player.health == 100:
		health.frame = 0
	elif player.health == 75:
		health.frame = 1
	elif player.health == 50:
		health.frame = 2
	elif player.health == 25:
		health.frame = 3
	else:
		if player.health == 0:
			health.frame = 4
			player.respawn()
			
