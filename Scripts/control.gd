extends Control

var playerScene = preload("res://Scenes/Player.tscn")
var map1Scene = preload("res://Scenes/Map1.tscn")
var map1
var player1
var player2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_initializeMap()
	_initializePlayer()
	_initalizeKeyBind()
	_goToMap(map1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	
	
func _initalizeKeyBind() -> void:
	player1.down = "S"
	player1.up = "W"
	player1.left = "A"
	player1.right = "D"
	player1.push = "Q"
	
	player2.down = "K"
	player2.up = "I"
	player2.left = "J"
	player2.right = "L"
	player2.push = "U"
	pass
func _initializePlayer() -> void:
	
	player1 = playerScene.instantiate()
	player2 = playerScene.instantiate()
	map1.position = Vector2(0,0)
	player1.position = Vector2(500,500)
	player2.position = Vector2(700,500)
	
	pass

func _initializeMap() -> void:
	map1 = map1Scene.instantiate()
	pass
	
func _goToMap(map) -> void:
	map.add_child(player1)
	map.add_child(player2)
	add_child(map)
	pass
