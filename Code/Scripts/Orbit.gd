extends Node3D
@export var orbit_center: NodePath  # The center of the orbit
@export var orbit_radius: float = 0 # Radius of the orbit
@export var orbit_speed: float = 1.0  # Speed of the orbit in radians per second

var angle: float = 0.0  # Current angle of the orbit

func _ready():
	# Ensure the orbit_center is a valid path and get its reference
	if not get_node_or_null(orbit_center):
		print("Error: Invalid orbit center node path.")
		return

func _process(delta: float):
	# Get the center node
	var center_node = get_node_or_null(orbit_center)
	if center_node:
		# Update the angle based on orbit_speed and delta time
		angle += orbit_speed * delta

		# Calculate the new position in the XZ plane for the orbit
		var new_x = center_node.position.x + orbit_radius * cos(angle)
		var new_z = center_node.position.z + orbit_radius * sin(angle)
		var new_position = Vector3(new_x, position.y, new_z)

		# Update the translation of the OrbitingNode to create the orbit effect
		position = new_position

