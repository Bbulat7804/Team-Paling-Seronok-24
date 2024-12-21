extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	$AudioStreamPlayer2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_back_pressed() -> void:
	var next_scene_path = "res://Scenes/ModeSelectScreen.tscn"
	get_tree().change_scene_to_file("res://Scenes/ModeSelectScreen.tscn")


func _on_text_edit_player_1_mouse_entered() -> void:
	$SoundClick.play()


func _on_text_edit_player_2_mouse_entered() -> void:
	$SoundClick.play()
	

func _on_button_start_game_mouse_entered() -> void:
	$SoundHover.play()


func _on_button_back_mouse_entered() -> void:
	$SoundHover.play()


func _on_button_start_game_pressed() -> void:
	Stats.p1Name = $CharacterBody2D/TextEditPlayer1.text
	Stats.p2Name = $CharacterBody2D2/TextEditPlayer2.text
	randomize()
	GameManager.mapIndex = int(randi_range(0,1))
	print(GameManager.mapIndex)
	get_tree().change_scene_to_file("res://Scenes/GameManager.tscn")
