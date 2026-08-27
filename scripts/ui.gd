extends Control

@onready var player = $"../../"
@onready var stamina = $stamina
@onready var health = $health

#stamina and health
func _process(delta: float) -> void:
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
			
