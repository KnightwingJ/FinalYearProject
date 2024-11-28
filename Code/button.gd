extends Area3D


var mat:StandardMaterial3D

var out_color:Color = Color.from_hsv(.3, 1, 1, 0.1)
var in_color:Color = Color.from_hsv(.7, 1, 1, 0.1)

@export var play:bool=true
@export var toggle:bool=false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	mat = StandardMaterial3D.new()
	$MeshInstance3D.set_surface_override_material(0, mat)
	mat.albedo_color = in_color
	pass # Replace with function body.




# Called when the object is clicked
func _on_button_pressed(button_name: String) -> void:
	#print("Click")
	#mat.albedo_color = out_color
	_toggle()
	if play:
		$AudioStreamPlayer3D.play()
	print("Button Pressed: %s" % button_name)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _toggle():
	if toggle==false:
		mat.albedo_color=out_color
	else:
		mat.albedo_color=in_color
	toggle=!toggle
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_on_button_pressed(self.name)
		 # Replace with function body.

func _on_input_event(camera, event, event_position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT :
			_on_button_pressed(self.name)
	pass # Replace with function body.
