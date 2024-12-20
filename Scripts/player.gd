class_name Player

extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var jump
var right
var left

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(Jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed(Left):
		velocity.x = -SPEED
	if Input.is_action_just_pressed(Right):
		velocity.x = SPEED
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	move_and_slide()
