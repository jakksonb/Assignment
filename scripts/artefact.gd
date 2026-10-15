extends Area2D

@onready var end_money_label: Label = $"end money"
@onready var end_label: Label = $"end"
@onready var top_ui: Sprite2D = $"Sprite2D3"
@onready var bottom_ui: Sprite2D = $"Sprite2D4"
@onready var retry: Label = $"retry"

func _ready() -> void: 
	top_ui.hide()
	bottom_ui.hide()
	end_label.hide()
	end_money_label.hide()
	retry.hide()
	
	
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Score.add_point(250)
		end_label.show()
		end_money_label.show()
		collision_layer = 0
		collision_mask = 0
		body.queue_free()
