extends CanvasLayer


@onready var score_label = $"UI/money"

func _process(delta: float) -> void:
	score_label.text = "MONEY: " + str(Score.score)
