extends Node3D

var steps = 16  # Number of steps
var tracks = 8  # Number of tracks
var step_size = 2.0  # Distance between steps in the grid

func _ready():
	for track in range(tracks):
		for step in range(steps):
			var step_instance = MeshInstance3D.new()
			step_instance.mesh = BoxMesh.new()
			step_instance.transform.origin = Vector3(step * step_size, 0, track * step_size)
			step_instance.name = "step_%d_%d" % [track, step]
			add_child(step_instance)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
