class_name Player

extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var down
var up
var left
var right

func _physics_process(delta: float) -> void:
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

	move_and_slide()
