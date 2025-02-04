extends Marker3D


@export var animation_scene:PackedScene
@export var animation_path:String
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#animation_path="res://Animations/Animations_Scenes/guitar_playing.tscn"
	#animation_scene=Variables.instrument_animation
	#print(animation_scene)
	var animation = Variables.instrument_animation.instantiate()
	add_child(animation)
	#"res://Animations/Animation_Scenes/guitar_playing.tscn"
	#animation_path.AnimationPlayer
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
