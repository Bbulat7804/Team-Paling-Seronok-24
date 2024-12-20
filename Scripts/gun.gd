extends CharacterBody2D
var bulletpath = preload("res://Scenes/bullet.tscn")

# Variables for controlling the bullet burst
var burst_interval = 1.0  # Time between bursts (in seconds)
var fire_rate = 0.3  # Time between individual bullet shots (in seconds)
var bullets_in_burst = 5  # Number of bullets per burst

var burst_timer = 0.0  # Timer to track the burst interval
var bullet_timer = 0.0  # Timer to track the fire rate between bullets
var bullets_fired = 0  # Counter to track how many bullets have been fired in the current burst

func _ready() -> void:
	global_rotation = 0
	burst_timer = burst_interval  # Set the burst interval

func _physics_process(delta):
	# Update burst timer
	burst_timer -= delta

	# Handle bullet firing only after the burst interval has passed
	if burst_timer <= 0:
		if bullets_fired < bullets_in_burst:
			bullet_timer -= delta  # Countdown the bullet timer
			if bullet_timer <= 0:
				fire()  # Fire the bullet
				bullets_fired += 1  # Increment the bullet counter
				bullet_timer = fire_rate  # Reset bullet timer for the next shot
		else:
			# Reset burst timer after all bullets in the burst are fired
			burst_timer = burst_interval
			bullets_fired = 0  # Reset the bullets fired counter

func fire():
	var bullet = bulletpath.instantiate()
	print("Bullet Fired")
	
	# Set bullet direction and position relative to the character's rotation
	bullet.dir = rotation
	# Make sure bullet spawns at the center of the character (global_position should be the center)
	bullet.pos = global_position
	bullet.rota = global_rotation  # Set bullet's rotation based on the character's rotation
	add_child(bullet)  # Add the bullet to the scene as a child of the character
