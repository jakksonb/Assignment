extends Node

var score: int = 0

func add_point(amount: int = 1) -> void:
	score += amount
	print("Score:", score)
