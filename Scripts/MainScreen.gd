extends Control

static var page
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not MainMenuSound.playing:
		MainMenuSound.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(float) -> void:
	pass

func _on_button_start_game_mouse_entered() -> void:
	$SoundHover.play()

func _on_button_options_mouse_entered() -> void:
	$SoundHover.play()

func _on_button_quit_mouse_entered() -> void:
	$SoundHover.play()

func _on_button_start_game_pressed() -> void:
	$SoundClick.play()
	var next_scene_path = "res://Scenes/ModeSelectScreen.tscn"
	get_tree().change_scene_to_file(next_scene_path)

func _on_button_options_pressed() -> void:
	$SoundClick.play()

func _on_button_quit_pressed() -> void:
	$SoundClick.play()
