extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	rotate_y(rad_to_deg(0.05)*delta)
	pass
