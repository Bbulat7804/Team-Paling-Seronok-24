extends Control

var playerScene = preload("res://Scenes/Player.tscn")
var playerCameraScene = preload("res://Scenes/PlayerCamera.tscn")
var playerCamera
var map1
var player1 : Player
var player2 : Player
# Called when the node enters the scene tree for the first time.L
func _ready() -> void:
	_initializeMap()
	_initializePlayer()
	_initalizeKeyBind()
	player1.position = Vector2(200,500)
	player2.position = Vector2(400,500)
	add_child(player1)
	add_child(player2)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	
	
func _initalizeKeyBind() -> void:
	player1.jump = "W"
	player1.left = "A"
	player1.right = "D"
	player1.character = "1"
	
	player2.jump = "I"
	player2.left = "J"
	player2.right = "L"
	player2.character = "1"
	pass
func _initializePlayer() -> void:
	player1 = playerScene.instantiate()
	player2 = playerScene.instantiate()
	playerCamera = playerCameraScene.instantiate()
	player1.add_child(playerCamera)
	pass

func _initializeMap() -> void:
	
	pass
	
func _goToMap(map) -> void:
	
	pass
