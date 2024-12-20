class_name Gun

extends Node2D
var bulletpath = preload("res://Scenes/bullet.tscn")

static var randomIndex : int
var randomizer

func _physics_process(delta):
	randomize()
	randomizer = int(randi_range(1,randomIndex))
	if randomizer == 100:
		fire()

func fire():
	var bullet = bulletpath.instantiate()
	
	# Set bullet direction and position relative to the character's rotation
	bullet.dir = rotation
	# Make sure bullet spawns at the center of the character (global_position should be the center)
	bullet.pos = global_position
	bullet.rota = global_rotation  # Set bullet's rotation based on the character's rotation
	add_child(bullet)  # Add the bullet to the scene as a child of the character
