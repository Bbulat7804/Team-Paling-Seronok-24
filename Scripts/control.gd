class_name GameManager

extends Control

const CLASSIC = "CLASSIC"
const POWERUP = "POWERUP"
const DOUBLETROUBLE = "DOUBLETROUBLE"
static var mode
var playerScene = preload("res://Scenes/Player.tscn")
var InGameStatsScene = preload("res://Scenes/ingameStats.tscn")
var map1Scene = preload("res://Scenes/L1MAP1.tscn")
var cameraScene = preload("res://Scenes/PlayerCamera.tscn")
var mainScreenScene = preload("res://Scenes/MainScreen.tscn")
var camera:Camera
var Streak1 = 0
var Streak2 = 0
@onready var P1RespawnTimer : Timer = $P1RespawnTimer
@onready var P2RespawnTimer : Timer = $P2RespawnTimer
var inGameStats : Stats
static var map1
static var mapArray = []
static var mapIndex
var player1 : Player
var player2 : Player
# Called when the node enters the scene tree for the first time.L
func _ready() -> void:
	if mode == DOUBLETROUBLE:
		Gun.randomIndex = 200
		Bullet.speed = 400
	else:
		Gun.randomIndex = 400
		Bullet.speed = 300
	_initializeMap()
	_initializePlayer()
	_initializeKeyBind()
	_goToMap(mapArray[mapIndex])
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Streak1==2 or Streak2==2:
		if mode == POWERUP:
			#spawn()
			print("spawn")
			Streak1 = 0
			Streak2 = 0
		
	if player1.isDead:
		$dieSoundPlayer.play()
		inGameStats.p2Score += 1
		_randomizeKey(player1,player2)
		player1.isDead = false
		remove_child(player1)
		P1RespawnTimer.start()
		Streak2 += 1
		Streak1 = 0
		
	if player2.isDead:
		$dieSoundPlayer.play()
		inGameStats.p1Score += 1
		_randomizeKey(player2,player1)
		player2.isDead = false
		remove_child(player2)
		P2RespawnTimer.start()
		Streak1 +=1
		Streak2 = 0
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
	var newKey
	var key = str(int(randi_range(65,90)))
	newKey = str(char(int(key)))
	var rand = int(randi_range(1,4)) 
	while newKey==win.left or newKey == win.right or newKey == win.jump or newKey == win.push or newKey == die.left or newKey == die.right or newKey == die.jump or newKey == die.push:
		randomize()
		key = str(int(randi_range(65,90)))
		newKey = str(char(int(key)))
	
	if rand == 1:
		if die==player1:
			inGameStats.p1Left = key
			player1.left = newKey
		else:
			inGameStats.p2Left = key
			player2.left = newKey
	elif rand == 2:
		if die==player1:
			inGameStats.p1Right = key
			player1.right = newKey
		else:
			inGameStats.p2Right = key
			player2.right = newKey
	elif rand == 3:
		if die==player1:
			inGameStats.p1Jump = key
			player1.jump = newKey
		else:
			inGameStats.p2Jump = key
			player2.jump = newKey
	else:
		if die==player1:
			inGameStats.p1Push = key
			player1.push = newKey
		else:
			inGameStats.p2Push = key
			player2.push = newKey
