extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.hasShield = true
		body.add_child(body.shieldEffect)
		body.shieldTimer.start()
		queue_free()
	pass # Replace with function body.
