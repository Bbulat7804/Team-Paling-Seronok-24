class_name Stats

extends Node2D


var p1Score = 0
var p2Score = 0
var p1Jump = "87"
var p1Left = "65"
var p1Right = "68"
var p1Push = "83"
var p2Jump = "73"
var p2Left = "74"
var p2Right = "75"
var p2Push = "76"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Score1/Panel/Player1Score.text = str(p1Score)
	$Score2/Panel/Player2Score.text = str(p2Score)
	$Score1/Panel/p1KeyJump.text = char(int(p1Jump))
	$Score1/Panel/p1KeyLeft.text = char(int(p1Left))
	$Score1/Panel/p1KeyPush.text = char(int(p1Push))
	$Score1/Panel/p1KeyRight.text = char(int(p1Right))
	$Score2/Panel/p2KeyJump.text = char(int(p2Jump))
	$Score2/Panel/p2KeyLeft.text = char(int(p2Left))
	$Score2/Panel/p2KeyPush.text = char(int(p2Push))
	$Score2/Panel/p2KeyRight.text = char(int(p2Right))
	pass
