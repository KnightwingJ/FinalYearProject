extends Node

@export var instrument:String="Guitar"
@export var steps: float = 1
@export var instrument_animation:PackedScene = preload("res://Animations/Animation_Scenes/Guitar.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func change_scene(new_Scene:String):
	instrument_animation=load(new_Scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
