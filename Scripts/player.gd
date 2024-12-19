class_name Player

extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var pushSpeed = 700
var down
var up
var left
var right
var push
var isPushed = false
var pushUp : PushArea
var pushDown : PushArea
var pushLeft : PushArea
var pushRight : PushArea

@onready var push_timer: Timer = $PushTimer
@onready var pushed_timer: Timer = $PushedTimer

func _ready() -> void:
	_initialize_push_area()
	pass
	
func _physics_process(delta: float) -> void:
	
	if isPushed:
		move_and_slide()
		pass
	# Add the gravity.
	if Input.is_action_pressed(down):
		velocity.y = SPEED
	if Input.is_action_pressed(up):
		velocity.y = -SPEED
	if Input.is_action_pressed(left):
		velocity.x = -SPEED
	if Input.is_action_pressed(right):
		velocity.x = SPEED
	if Input.is_action_pressed(down) and Input.is_action_pressed(up):
		velocity.y = 0
	if !Input.is_action_pressed(down) and !Input.is_action_pressed(up):
		velocity.y = 0
	if Input.is_action_pressed(left) and Input.is_action_pressed(right):
		velocity.x = 0
	if !Input.is_action_pressed(left) and !Input.is_action_pressed(right):
		velocity.x = 0
	if Input.is_action_just_pressed(push):
		_push()
		
	move_and_slide()

func _initialize_push_area() -> void:
	pushUp = get_node("PushUp")
	pushUp.pushX = 0
	pushUp.pushY = -pushSpeed
	pushDown = get_node("PushDown")
	pushDown.pushX = 0
	pushDown.pushY = pushSpeed
	pushLeft = get_node("PushLeft")
	pushLeft.pushX = -pushSpeed
	pushLeft.pushY = 0
	pushRight = get_node("PushRight")
	pushRight.pushX = pushSpeed
	pushRight.pushY = 0
	pass

func _push() -> void:
	pushUp.pushable = true
	pushDown.pushable = true
	pushRight.pushable = true
	pushLeft.pushable = true
	push_timer.start()

func _on_push_timer_timeout() -> void:
	pushUp.pushable = false
	pushDown.pushable = false
	pushLeft.pushable = false
	pushRight.pushable = false
	pass # Replace with function body.

func _pushed(x:int, y:int):
	velocity.x = x
	velocity.y = y
	isPushed = true
	pushed_timer.start()
	pass
											 
func _on_pushed_timer_timeout() -> void:
	velocity.y = 0
	velocity.x = 0
	isPushed = false
	pass # Replace with function body.
