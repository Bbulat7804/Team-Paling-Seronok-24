class_name Stats

extends Node2D


var p1Score = 0
var p2Score = 0
var p1Jump = "W"
var p1Left = "A"
var p1Right = "D"
var p1Push = "S"
var p2Jump = "I"
var p2Left = "J"
var p2Right = "K"
var p2Push = "L"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Score1/Panel/Player1Score.text = str(p1Score)
	$Score2/Panel/Player2Score.text = str(p2Score)
	$Score1/Panel/p1KeyJump.text = p1Jump
	$Score1/Panel/p1KeyLeft.text = p1Left
	$Score1/Panel/p1KeyPush.text = p1Push
	$Score1/Panel/p1KeyRight.text = p1Right
	$Score2/Panel/p2KeyJump.text = p2Jump
	$Score2/Panel/p2KeyLeft.text = p2Left
	$Score2/Panel/p2KeyPush.text = p2Push
	$Score2/Panel/p2KeyRight.text = p2Right
	pass
