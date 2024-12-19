class_name PushArea

extends Area2D

var pushY
var pushX
var velocity
var pushable = false
var player : Player
var inside = false

func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body is Player:
		player = body
		inside = true
	pass # Replace with function body.


func _process(delta: float) -> void:
	if pushable and inside:
			player._pushed(pushX,pushY)
	pass
	
func _set_push(x:int, y:int) -> void:
	pushX = x
	pushY = y

func _on_body_exited(body: Node2D) -> void:
	inside = false
	player = null
	pass # Replace with function body.
