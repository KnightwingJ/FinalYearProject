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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _toggle():
	if toggle==false:
		mat.albedo_color=in_color
		#$MeshInstance3D.size+=Vector3(0.01,0.01,0.01)
	else:
		mat.albedo_color=out_color
		#$MeshInstance3D.size-=Vector3(0.01,0.01,0.01)
	#toggle=!toggle
	
func _on_area_entered(area):
	toggle=!toggle
	_toggle()
	pass # Replace with function body.
