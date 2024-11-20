extends Node3D

var samples:Array

@export var button_scene:PackedScene
@export var path_str="res://Sounds/"
@export var guitar="res://Sounds/Guitar"
@export var perform:Control


@onready var button_container = $CanvasLayer/VBoxContainer

var sound_sequence=[]
var sound_files=[]
var audio_player = AudioStreamPlayer.new()
func _ready():
	loadSounds()
	create_buttons()
	
	pass
func loadSounds():
	var dir = DirAccess.open("res://Sounds/Guitar")
	if dir:
		dir.list_dir_begin()
		var file_name=dir.get_next()
		while file_name:
			if file_name.ends_with(".mp3"):
				sound_files.append("res://Sounds/Guitar/"+file_name)
			file_name=dir.get_next()
		dir.list_dir_end()
	print("Loaded Sound Files:",sound_files)
	
func create_buttons():
	for sound_path in sound_files:
		var button = Button.new()
		button.text = sound_path.get_file()
		button_container.add_child(button)
		#button.pressed.connect(lambda path=sound_path: on_sound_button_pressed(path))
		
#func on_sound_button_pressed(sound_path: String):
	#print("Playing sound: ",sound_path)
	#play_sound(sound_path)

func play_sound(sound_path: String):
	var stream = load(sound_path)
	if stream:
		audio_player.stream=stream
		add_child(audio_player)
		audio_player.play()
	
func on_sound_button_pressed(sound_path:String):
	print("Added to sequence")
	sound_sequence.append(sound_path)
	perform.sound_sequence=sound_sequence

func _process(delta):
	pass
