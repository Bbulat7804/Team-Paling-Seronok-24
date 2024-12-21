class_name GameManager

extends Control

const CLASSIC = "CLASSIC"
const POWERUP = "POWERUP"
const DOUBLETROUBLE = "DOUBLETROUBLE"
static var mode
var playerScene = preload("res://Scenes/Player.tscn")
var InGameStatsScene = preload("res://Scenes/ingameStats.tscn")
var map1Scene = preload("res://Scenes/MAP1CYBERPUNK.tscn")
var map2Scene = preload("res://Scenes/MAP2WINTER.tscn")
var cameraScene = preload("res://Scenes/PlayerCamera.tscn")
var mainScreenScene = preload("res://Scenes/MainScreen.tscn")
var camera: Camera
var Streak1 = 0
var Streak2 = 0
@onready var P1RespawnTimer: Timer = $P1RespawnTimer
@onready var P2RespawnTimer: Timer = $P2RespawnTimer
var inGameStats: Stats
static var map1
static var map2
static var mapArray = []
static var mapIndex
var player1: Player
var player2: Player
var default_sprite_scale = Vector2(3.0, 3.0) # Increased size for default
var pressed_sprite_scale = Vector2(2.5, 2.5) # Slightly smaller for pressed effectwi
var winningPoint = 3
static var deathPrompt
func _ready() -> void:
	MainMenuSound.stop()
	$AudioStreamPlayer2D.play()
	
	if mode == DOUBLETROUBLE:
		Gun.randomIndex = 200
		Bullet.speed = 500
	else:
		Gun.randomIndex = 400
		Bullet.speed = 300
	_initializeMap()
	_initializePlayer()
	_initializeKeyBind()
	_goToMap(mapArray[mapIndex])
	pass

func _process(delta: float) -> void:
	if inGameStats.p1Score == 3 or inGameStats.p2Score == 3:
		var next_scene_path = "res://Scenes/EndScreen.tscn"
		get_tree().change_scene_to_file(next_scene_path)
	_handle_key_scaling(player1.jump, "Score1/Panel/SpritePlayer1Up")
	_handle_key_scaling(player1.left, "Score1/Panel/SpritePlayer1Left")
	_handle_key_scaling(player1.push, "Score1/Panel/SpritePlayer1Down")
	_handle_key_scaling(player1.right, "Score1/Panel/SpritePlayer1Right")
	_handle_key_scaling(player2.jump, "Score2/Panel/SpritePlayer2Up")
	_handle_key_scaling(player2.left, "Score2/Panel/SpritePlayer2Left")
	_handle_key_scaling(player2.push, "Score2/Panel/SpritePlayer2Down")
	_handle_key_scaling(player2.right, "Score2/Panel/SpritePlayer2Right")
	if Streak1 == 2:
		player1.hasShield = true
		player1.add_child(player1.shieldEffect)
		player1.shieldTimer.start()
		Streak1 = 0
		
	if Streak2 == 2:
		player2.hasShield = true
		player2.add_child(player2.shieldEffect)
		player2.shieldTimer.start()
		Streak2 = 0
		

	if player1.isDead:
		$dieSoundPlayer.play()
		inGameStats.p2Score += 1
		_randomizeKey(player1, player2)
		player1.isDead = false
		remove_child(player1)
		P1RespawnTimer.start()
		Streak2 += 1
		Streak1 = 0
	if player2.isDead:
		$dieSoundPlayer.play()
		inGameStats.p1Score += 1
		_randomizeKey(player2, player1)
		player2.isDead = false
		remove_child(player2)
		P2RespawnTimer.start()
		Streak1 += 1
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
	map2 = map2Scene.instantiate()
	mapArray.push_front(map1)
	mapArray.push_front(map2)
	camera = cameraScene.instantiate()
	pass

func _goToMap(map) -> void:
	_resetInGameStats()
	camera._linkPlayer(player1, player2)
	player1.position = Vector2(400, 550)
	player2.position = Vector2(600, 550)
	add_child(map)
	add_child(player1)
	add_child(player2)
	add_child(inGameStats)
	add_child(camera)
	pass

func _resetInGameStats():
	inGameStats.p1Score = 0
	inGameStats.p2Score = 0

func _on_p_1_respawn_timer_timeout() -> void:
	player1.position = Vector2(400, 550)
	add_child(player1)
	pass

func _on_p_2_respawn_timer_timeout() -> void:
	player2.position = Vector2(600, 550)
	add_child(player2)
	pass

func _randomizeKey(win: Player, die: Player):
	randomize()
	var newKey
	var key = str(int(randi_range(65, 90)))
	newKey = str(char(int(key)))
	var rand = int(randi_range(1, 4))
	while newKey == win.left or newKey == win.right or newKey == win.jump or newKey == win.push or newKey == die.left or newKey == die.right or newKey == die.jump or newKey == die.push:
		randomize()
		key = str(int(randi_range(65, 90)))
		newKey = str(char(int(key)))
	if rand == 1:
		if die == player1:
			inGameStats.p1Left = key
			player1.left = newKey
		else:
			inGameStats.p2Left = key
			player2.left = newKey
	elif rand == 2:
		if die == player1:
			inGameStats.p1Right = key
			player1.right = newKey
		else:
			inGameStats.p2Right = key
			player2.right = newKey
	elif rand == 3:
		if die == player1:
			inGameStats.p1Jump = key
			player1.jump = newKey
		else:
			inGameStats.p2Jump = key
			player2.jump = newKey
	else:
		if die == player1:
			inGameStats.p1Push = key
			player1.push = newKey
		else:
			inGameStats.p2Push = key
			player2.push = newKey
	_update_key_sprites()

func _update_key_sprites():
	var base_path = "res://Assets/images/SimpleKeys/SimpleKeys/Jumbo/Dark/Single PNGs/"
	var p1_up_sprite = inGameStats.get_node("Score1/Panel/SpritePlayer1Up")
	var p1_left_sprite = inGameStats.get_node("Score1/Panel/SpritePlayer1Left")
	var p1_down_sprite = inGameStats.get_node("Score1/Panel/SpritePlayer1Down")
	var p1_right_sprite = inGameStats.get_node("Score1/Panel/SpritePlayer1Right")
	var p2_up_sprite = inGameStats.get_node("Score2/Panel/SpritePlayer2Up")
	var p2_left_sprite = inGameStats.get_node("Score2/Panel/SpritePlayer2Left")
	var p2_down_sprite = inGameStats.get_node("Score2/Panel/SpritePlayer2Down")
	var p2_right_sprite = inGameStats.get_node("Score2/Panel/SpritePlayer2Right")
	if p1_up_sprite and p1_left_sprite and p1_down_sprite and p1_right_sprite:
		p1_up_sprite.texture = load(base_path + player1.jump + ".png")
		p1_left_sprite.texture = load(base_path + player1.left + ".png")
		p1_down_sprite.texture = load(base_path + player1.push + ".png")
		p1_right_sprite.texture = load(base_path + player1.right + ".png")
	if p2_up_sprite and p2_left_sprite and p2_down_sprite and p2_right_sprite:
		p2_up_sprite.texture = load(base_path + player2.jump + ".png")
		p2_left_sprite.texture = load(base_path + player2.left + ".png")
		p2_down_sprite.texture = load(base_path + player2.push + ".png")
		p2_right_sprite.texture = load(base_path + player2.right + ".png")

func _handle_key_scaling(action: String, sprite_path: String) -> void:
	var sprite = inGameStats.get_node(sprite_path)
	if sprite:
		if Input.is_action_pressed(action):
			sprite.scale = pressed_sprite_scale
		else:
			sprite.scale = default_sprite_scale
