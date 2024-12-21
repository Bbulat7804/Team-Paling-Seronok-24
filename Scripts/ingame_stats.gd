class_name Stats

extends Node2D


var p1Score = 0
var p2Score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Score1/Panel/Player1Score.text = str(p1Score)
	$Score2/Panel/Player2Score.text = str(p2Score)
	pass
