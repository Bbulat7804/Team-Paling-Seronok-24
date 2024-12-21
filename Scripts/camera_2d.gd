class_name Camera

extends Camera2D

var player1
var player2

# Minimum and maximum zoom levels
var min_zoom = Vector2(2.1, 2.1) 
var max_zoom = Vector2(0.7, 0.7) 
var zoom_factor = 0.3 

func _linkPlayer(p1, p2):
	player1 = p1
	player2 = p2

func _process(delta: float) -> void:
	if player1 == null or player2 == null:
		pass
	print("process")
	# Calculate the average position of the two players
	var average_position = (player1.position + player2.position) / 2
	position = average_position  # Center the camera between the two players

	# Calculate the distance between the two players
	var distance = player1.position.distance_to(player2.position)

	# Determine the zoom level based on the distance
	var target_zoom = min_zoom

	# Adjust the zoom based on the distance
	if distance > 300:  # Adjust this threshold as needed
		target_zoom = max_zoom
	else:
		# Interpolate zoom based on distance
		target_zoom = min_zoom.lerp(max_zoom, distance / 300)  # Adjust the divisor as needed

	# Set the camera zoom
	zoom = target_zoom
