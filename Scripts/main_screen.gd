extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_start_game_mouse_entered() -> void:
	$SoundHover.play() # Replace with function body.


func _on_button_options_mouse_entered() -> void:
	$SoundHover.play()  # Replace with function body.


func _on_button_quit_mouse_entered() -> void:
	$SoundHover.play()  # Replace with function body.


func _on_button_start_game_pressed() -> void:
	$SoundClick.play() # Replace with function body.


func _on_button_options_pressed() -> void:
	$SoundClick.play()  # Replace with function body.


func _on_button_quit_pressed() -> void:
	$SoundClick.play() # Replace with function body.
