extends Control

var map1
var player1
var player2
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
	player1.down = "S"
	player1.up = "W"
	player1.left = "A"
	player1.right = "D"
	
	player2.down = "K"
	player2.up = "I"
	player2.left = "J"
	player2.right = "L"
	pass
func _initializePlayer() -> void:
	
	
	pass

func _initializeMap() -> void:
	
	pass
	
func _goToMap(map) -> void:
	
	pass
