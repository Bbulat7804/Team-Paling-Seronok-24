extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.pushSpeed += 1500
		body.hasShield = true
		body.strengthTimer.start()
		body.shieldTimer.start()
		queue_free()
	pass # Replace with function body.
