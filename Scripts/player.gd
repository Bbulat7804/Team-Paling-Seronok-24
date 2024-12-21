class_name Player

extends CharacterBody2D

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var pushTimer : Timer = $PushTimer
@onready var pushedTimer : Timer = $PushedTimer
@onready var pushAreaLeft : Area2D = $PushAreaLeft
@onready var pushAreaRight : Area2D = $PushAreaRight
@onready var immuneTimer : Timer = $ImmuneTimer
@onready var walkingSound : AudioStreamPlayer2D = $walkingSoundPlayer
@onready var dieSound : AudioStreamPlayer2D = $dieSoundPlayer
@onready var jumpSound : AudioStreamPlayer2D = $JumpSoundPlayer
@onready var strengthTimer : Timer = $StrengthTimer
@onready var shieldTimer : Timer = $ShieldTimer
@onready var exitWorldTimer : Timer = $ExitWorldTimer

var shieldEffectSceme = preload("res://Scenes/ShieldEffect.tscn")
var shieldEffect
var hasShield = false
const SPEED = 200.0
const JUMP_VELOCITY = -540.0
var jump
var right
var left
var direction
var character
var pushSpeed = 700
var push
var isPushed = false
var pushLeft : PushArea
var pushRight : PushArea
var isDead = false
var immune = false
var exit = false
var immuneExit = false
func _ready():
	_initialize_push_area()
	shieldEffect = shieldEffectSceme.instantiate()
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		walkingSound.stop()
		velocity += get_gravity() * delta
		
	pushLeft.pushX = -pushSpeed
	pushRight.pushX = pushSpeed
	
	if isPushed:
		move_and_slide()
		pass
	if Input.is_action_just_pressed(jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("run" + character)
		walkingSound.stop()
		jumpSound.play()
	direction = Input.get_axis(left, right)
	if direction>0:
		if not walkingSound.playing and is_on_floor():
			walkingSound.play()
		velocity.x = SPEED * 1
	elif direction<0:
		if not walkingSound.playing and is_on_floor():
			walkingSound.play()
		velocity.x = SPEED * -1
	else:
		walkingSound.stop()
		velocity.x = 0
	if is_on_floor():
		if direction>0:
			animation.play("run" + character)
			animation.flip_h = false;
			
		elif direction<0:
			animation.play("run" + character)
			animation.flip_h = true;
			
		else:
			animation.play("idle" + character)
	else:
		if velocity.y<0: 
			animation.play("jump" + character)
		else:
			animation.play("jump" + character)
	if Input.is_action_just_pressed(push):
		_push()
	move_and_slide()	
	
func _die():
	if hasShield:
		print("masuk")
		hasShield = false
		remove_child(shieldEffect)
		return
	if !immune :
		print("tak immune")
		immuneTimer.start()
		isDead = true
		immune = true
		immuneExit = true

func _exitWorld():
	if immuneExit:
		return
	exitWorldTimer.start()
	hasShield = false
	remove_child(shieldEffect)
	isDead = true
	immune = true
	immuneExit = true

func _push():
	pushLeft.pushable = true
	pushRight.pushable = true
	pushTimer.start()

func _pushed(x:int):
	if immune:
		pass
	velocity.x = x
	isPushed = true
	pushedTimer.start()
	pass


func _on_push_timer_timeout() -> void:
	pushLeft.pushable = false
	pushRight.pushable = false
	pass


func _on_pushed_timer_timeout() -> void:
	velocity.x = 0
	isPushed = false;
	pass

func _initialize_push_area() -> void:
	pushLeft = get_node("PushAreaLeft")
	pushRight = get_node("PushAreaRight")
	


func _on_immune_timer_timeout() -> void:
	immune = false
	pass # Replace with function body.


func _on_strength_timer_timeout() -> void:
	pushSpeed -= 1500
	pass # Replace with function body.


func _on_shield_timer_timeout() -> void:
	hasShield = false
	pass # Replace with function body.


func _on_exit_world_timer_timeout() -> void:
	immuneExit = false
	pass # Replace with function body.
