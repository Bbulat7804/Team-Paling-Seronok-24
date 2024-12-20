extends Control

var playerScene = preload("res://Scenes/Player.tscn")
var map1
var player1 : Player
var player2 : Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_initializeMap()
	_initializePlayer()
	_initalizeKeyBind()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass	
	
func _initalizeKeyBind() -> void:
	player1.jump = "W"
	player1.left = "A"
	player1.right = "D"
	
	player1.jump = "I"
	player1.left = "J"
	player1.right = "L"
	pass
func _initializePlayer() -> void:
	player1 = 
	
	pass

func _initializeMap() -> void:
	
	pass
	
func _goToMap(map) -> void:
	
	pass
