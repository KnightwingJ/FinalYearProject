extends Node

var sound_sequence=[] # Store the sequence gloablly
var performance_scene:PackedScene = preload("res://Performance.tscn")
# Called when the node enters the scene tree for the first time.

func switch_to_playback_scene():
	if get_tree().current_scene:
		get_tree().current_scene.queue_free()
	var new_scene=performance_scene.instantiate()
	get_tree().root.add_child(new_scene)


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
