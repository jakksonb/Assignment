extends CanvasLayer


@onready var score_label = $"coin"

func _process(delta: float) -> void:
	score_label.text = "COINS: " + str(Score.score)
