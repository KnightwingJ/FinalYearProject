extends Node


@export var menu_path:NodePath #Path to menu

var menu: Control


var current_index = 0  # To track the current sound being played.
var sound_player:AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalSoundManager.sound_sequence.size() > 0:
		GlobalSoundManager.play_next_sound()
		
	else:
		print("No sounds in the sequence to play.")
