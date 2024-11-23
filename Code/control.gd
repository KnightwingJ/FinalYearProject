extends Control

var sound_sequence=[]
var animation_queue=[]


var animation_sources={
	"guitar":preload("res://Animations/Animation_Scenes/guitar_playing.tscn"),
	"piano":preload("res://Animations/Animation_Scenes/piano_playing.tscn"),
	"piano2":preload("res://Animations/Animation_Scenes/piano_playing_2.tscn"),
	"drums":preload("res://Animations/Animation_Scenes/playing_drums.tscn")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if animation_queue.size()>0:
		Global.animation_queue=animation_queue
		get_tree().change_scene_to_file("res://Performance.tscn")
	pass # Replace with function body.

func _on_guitar_pressed():
	_add_animation("Guitar")
	pass # Replace with function body.

func _add_animation(animation_name):
	animation_queue.append(animation_name)
	print("Added ")
