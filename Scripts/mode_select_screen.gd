extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_mouse_entered() -> void:
	$SoundHover.play() # Replace with function body.


func _on_button_2_mouse_entered() -> void:
	$SoundHover.play() # Replace with function body.


func _on_button_3_mouse_entered() -> void:
	$SoundHover.play() # Replace with function body.
	

func _on_button_back_pressed() -> void:
	var next_scene_path = "res://Scenes/MainScreen.tscn"
	get_tree().change_scene_to_file("res://Scenes/MainScreen.tscn")# Replace with function body.


func _on_button_classic_pressed() -> void:
	GameManager.mode = GameManager.CLASSIC
	var next_scene_path = "res://Scenes/PlayerNameScreen.tscn"
	get_tree().change_scene_to_file("res://Scenes/PlayerNameScreen.tscn")


func _on_button_power_up_pressed() -> void:
	GameManager.mode = GameManager.POWERUP
	var next_scene_path = "res://Scenes/PlayerNameScreen.tscn"
	get_tree().change_scene_to_file("res://Scenes/PlayerNameScreen.tscn")


func _on_button_double_trouble_pressed() -> void:
	GameManager.mode = GameManager.DOUBLETROUBLE
	var next_scene_path = "res://Scenes/PlayerNameScreen.tscn"
	get_tree().change_scene_to_file("res://Scenes/PlayerNameScreen.tscn")
