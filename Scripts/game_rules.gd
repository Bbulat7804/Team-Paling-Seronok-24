extends Node
@onready var game_rules: Node = %Game_Rules
@onready var label: Label = %Label

var points = 0
func add_point():
	points += 10
	print(points)
	label.text = "Score: " + str(points)
