extends Node

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/1.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Level/2.tscn")
