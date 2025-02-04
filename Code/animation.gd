extends Marker3D


@export var animation_scene:PackedScene
@export var animation_path:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_path="res://Animations/"+Variables.instrument_animation
	animation_scene=load(str(animation_path))
	var animation = animation_scene.instantiate()
	add_child(animation)
	
	#animation_path.AnimationPlayer
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
