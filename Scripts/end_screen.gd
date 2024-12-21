extends Control

#Need to change player name and points to using gettext
var player1Name = ""
var player2Name = ""
var player1Points:int = 0000
var player2Points:int = 0000
static var page


func _ready() -> void:
	player1Name = Stats.p1Name
	player2Name = Stats.p2Name
	var player1Points:int = Stats.p1Score
	var player2Points:int = Stats.p2Score
	$LabelPlayer1Name.text = "Player(1): " + str(player1Name)
	$LabelPlayer2Name.text = "Player(2): " + str(player2Name)
	$LabelPlayer1Name/LabelPlayer1Points.text = str(player1Points)
	$LabelPlayer2Name/LabelPlayer2Points.text = str(player2Points)
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


func _on_button_main_menu_pressed() -> void:
	var next_scene_path = "res://Scenes/MainScreen.tscn"
	get_tree().change_scene_to_file(next_scene_path)
