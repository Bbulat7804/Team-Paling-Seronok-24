class_name Player

extends CharacterBody2D

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 200.0
const JUMP_VELOCITY = -270.0
var jump
var right
var left
var direction
var character

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animation.play("run" + character)
	# Get the input direction and handle the movement/deceleration
	# As good practice, you should replace UI actions with custom gameplay actions.

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
	queue_free()
