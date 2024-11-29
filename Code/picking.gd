extends Node3D

var mat:StandardMaterial3D

var out_color:Color = Color.from_hsv(.3, 1, 1, 0.1)
var in_color:Color = Color.from_hsv(.7, 1, 1, 0.1)

@export var play:bool=true
@export var toggle:bool=false


@onready var ray = $RayCast3D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var e:InputEventMouseButton
		var camera = $Camera3D
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 1000
		ray.transform.origin = from
		ray.target_position = to
		ray.enabled = true
		if ray.is_colliding():
			var collider = ray.get_collider()
			print(collider.name)
			_toggle()
			#_on_button_pressed(collider.name)
			ray.enabled = false
		
		
		
		
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mat = StandardMaterial3D.new()
	$Box/Meshy.set_surface_override_material(0, mat)
	mat.albedo_color = in_color
	pass # Replace with function body.

# Called when the object is clicked
func _on_button_pressed(button_name: String) -> void:
	#print("Click")
	mat.albedo_color = out_color
	_toggle()
	#if play:
	#	$AudioStreamPlayer3D.play()
	print("Button Pressed: %s" % button_name)



func _toggle():
	if toggle==false:
		mat.albedo_color=out_color
	else:
		mat.albedo_color=in_color
	toggle=!toggle
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
