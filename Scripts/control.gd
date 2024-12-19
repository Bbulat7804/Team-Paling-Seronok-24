extends Control

var playerScene = preload("res://Scenes/Player.tscn")
var map1Scene = preload("res://Scenes/Map1.tscn")
var map1
var player1
var player2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	map1 = map1Scene.instance()
	player1 = playerScene.instance()
	player2 = playerScene.instance()
	map1.position = Vector2(0,0)
	player1.position = Vector2(100,50)
	player2.position = Vector2(-100,50)
	add_child(map1)
	map1.add_child(player1)
	map1.add_child(player2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	
