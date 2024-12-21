class_name PushArea

extends Area2D

var pushX
var velocity
var pushable = false
var player : Player
var inside = false

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player = body
		inside = true
	pass # Replace with function body.


func _process(delta: float) -> void:
	if pushable and inside:
		player._pushed(pushX)
		pass
	
func _on_body_exited(body: Node2D) -> void:
	inside = false
	player = null
	pass # Replace with function body.var x
