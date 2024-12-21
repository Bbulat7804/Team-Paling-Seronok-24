extends Control

var playerScene = preload("res://Scenes/Player.tscn")
var playerCameraScene = preload("res://Scenes/PlayerCamera.tscn")
var playerCamera
var map1Scene = preload("res://Scenes/L1MAP1.tscn")
var map1
var player1 : Player
var player2 : Player
# Called when the node enters the scene tree for the first time.L
func _ready() -> void:
	Gun.randomIndex = 100
	Bullet.speed = 500
	_initializeMap()
	_initializePlayer()
	_initalizeKeyBind()
	#_goToMap(map1)
	player1.position = Vector2(500,700)
	player2.position = Vector2(700,700)
	add_child(player1)
	add_child(player2)
	add_child(map1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	
	
func _initalizeKeyBind() -> void:
	player1.jump = "W"
	player1.left = "A"
	player1.right = "D"
	player1.push = "S"
	player1.character = "1"
	
	player2.jump = "I"
	player2.left = "J"
	player2.right = "L"
	player2.push = "K"
	player2.character = "1"
	pass
func _initializePlayer() -> void:
	player1 = playerScene.instantiate()
	player2 = playerScene.instantiate()
	playerCamera = playerCameraScene.instantiate()
	pass

func _initializeMap() -> void:
	map1 = map1Scene.instantiate()
	pass
	
func _goToMap(map) -> void:
	print("go to map ",map)
	player1.position = Vector2(500,700)
	player2.position = Vector2(700,700)
	add_child(player1)
	add_child(player2)
	add_child(map)
	pass
