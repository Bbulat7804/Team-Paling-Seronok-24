class_name GameManager

extends Control

var playerScene = preload("res://Scenes/Player.tscn")
var InGameStatsScene = preload("res://Scenes/ingameStats.tscn")
var map1Scene = preload("res://Scenes/L1MAP1.tscn")
var cameraScene = preload("res://Scenes/PlayerCamera.tscn")
var mainScreenScene = preload("res://Scenes/MainScreen.tscn")
var camera:Camera
@onready var P1RespawnTimer : Timer = $P1RespawnTimer
@onready var P2RespawnTimer : Timer = $P2RespawnTimer
var inGameStats : Stats
static var map1
static var mapArray = []
static var p1Name
static var p2Name
static var mapIndex
var player1 : Player
var player2 : Player
# Called when the node enters the scene tree for the first time.L
func _ready() -> void:
	Gun.randomIndex = 100
	Bullet.speed = 300
	_initializeMap()
	_initializePlayer()
	_initializeKeyBind()
	_goToMap(mapArray[mapIndex])
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player1.isDead:
		$dieSoundPlayer.play()
		inGameStats.p2Score += 1
		player1.isDead = false
		remove_child(player1)
		P1RespawnTimer.start()
		
	if player2.isDead:
		$dieSoundPlayer.play()
		inGameStats.p1Score += 1
		player2.isDead = false
		remove_child(player2)
		P2RespawnTimer.start()
	pass
	
func _initializeKeyBind() -> void:
	player1.jump = "W"
	player1.left = "A"
	player1.right = "D"
	player1.push = "S"
	player1.character = "1"
	
	player2.jump = "I"
	player2.left = "J"
	player2.right = "L"
	player2.push = "K"
	player2.character = "2"
	pass
func _initializePlayer() -> void:
	player1 = playerScene.instantiate()
	player2 = playerScene.instantiate()
	pass

func _initializeMap() -> void:
	inGameStats = InGameStatsScene.instantiate()
	map1 = map1Scene.instantiate()
	mapArray.push_front(map1)
	camera = cameraScene.instantiate()
	pass
	
func _goToMap(map) -> void:
	_resetInGameStats()
	camera._linkPlayer(player1,player2)
	player1.position = Vector2(400,550)
	player2.position = Vector2(600,550)
	add_child(map1)
	add_child(player1)
	add_child(player2)
	add_child(inGameStats)
	add_child(camera)
	pass

func _resetInGameStats():
	inGameStats.p1Score = 0
	inGameStats.p2Score = 0


func _on_p_1_respawn_timer_timeout() -> void:
	player1.position = Vector2(400,550)
	add_child(player1)
	pass # Replace with function body.

func _ChangePage(page1, page2):
	remove_child(page1)
	add_child(page2)
	
func _on_p_2_respawn_timer_timeout() -> void:
	player2.position = Vector2(600,550)
	add_child(player2)
	pass # Replace with function body.

func _randomizeKey(die:Player,win:Player):
	randomize()
	var key
	var rand = int(randi_range(1,4)) 
	if rand == 1:
		die.jump = char(int(randi_range(65,90)))
		while die.jump==win.jump or die.jump==win.left or die.jump == win.right or die.jump == win.push:
			die.jump = char(int(randi_range(65,90)))
		key = die.jump
		if die == player1:
			inGameStats.p1Jump = key
		else:
			inGameStats.p2Jump

	if rand == 2:
		die.left = char(int(randi_range(65,90)))
		while die.left==win.jump or die.left==win.left or die.left == win.right or die.left == win.push:
			die.left = char(int(randi_range(65,90)))
		key = die.left
		if die == player1:
			inGameStats.p1Left = key
		else:
			inGameStats.p2Left
	if rand == 3:
		die.right = char(int(randi_range(65,90)))
		while die.right==win.jump or die.right==win.left or die.right == win.right or die.right == win.push:
			die.right = char(int(randi_range(65,90)))
	else:
		die.push = char(int(randi_range(65,90)))
		while die.push==win.jump or die.push==win.left or die.push == win.right or die.push == win.push:
			die.push = char(int(randi_range(65,90)))
