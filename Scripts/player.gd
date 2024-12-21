class_name Player

extends CharacterBody2D

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var pushTimer : Timer = $PushTimer
@onready var pushedTimer : Timer = $PushedTimer
@onready var pushAreaLeft : Area2D = $PushAreaLeft
@onready var pushAreaRight : Area2D = $PushAreaRight
@onready var immuneTimer : Timer = $ImmuneTimer
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

func _ready():
	_initialize_push_area()
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if isPushed:
		move_and_slide()
		pass


	if Input.is_action_just_pressed(jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("run" + character)

	if Input.is_action_just_pressed(push):
		_push()
	
	direction = Input.get_axis(left, right)
	if direction>0:
		velocity.x = SPEED * 1
	elif direction<0:
		velocity.x = SPEED * -1
	else:
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
	move_and_slide()	
	
func _die():
	if !immune:
		immuneTimer.start()
		isDead = true
		immune = true

func _exitWorld():
	immuneTimer.start()
	isDead = true
	immune = true
	print("Exit")
	
func _push():
	pushLeft.pushable = true
	pushRight.pushable = true
	pushTimer.start()

func _pushed(x:int):
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
	pushLeft.pushX = -pushSpeed
	pushRight.pushX = pushSpeed


func _on_immune_timer_timeout() -> void:
	print("dah tak immune")
	immune = false
	pass # Replace with function body.
