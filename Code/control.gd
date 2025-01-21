extends Control

var sound_sequence=[]
var animation_queue=[]

var chords={
	"E Chord":preload("res://Sounds/Guitar/e_major.mp3"),
	"A Chord":preload("res://Sounds/Guitar/a_major.mp3"),
	"D Chord":preload("res://Sounds/Guitar/d_major.mp3"),
	"C Chord":preload("res://Sounds/Guitar/c_major.mp3"),
	"G Chord":preload("res://Sounds/Guitar/g_major.mp3")
}

var animation_sources={
	"guitar":preload("res://Animations/Animation_Scenes/guitar_playing.tscn"),
	"piano":preload("res://Animations/Animation_Scenes/piano_playing.tscn"),
	"piano2":preload("res://Animations/Animation_Scenes/piano_playing_2.tscn"),
	"drums":preload("res://Animations/Animation_Scenes/playing_drums.tscn")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"E Chord".pressed.connect(Callable(self, "_on_button_pressed").bind("E Chord"))
	$"A Chord".pressed.connect(Callable(self, "_on_button_pressed").bind("A Chord"))
	$"D Chord".pressed.connect(Callable(self, "_on_button_pressed").bind("D Chord"))
	$"G Chord".pressed.connect(Callable(self, "_on_button_pressed").bind("G Chord"))
	$"C Chord".pressed.connect(Callable(self, "_on_button_pressed").bind("C Chord"))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed(button_name:String):
	if chords.has(button_name):
		var sound = AudioStreamPlayer.new()
		sound.stream=chords[button_name]
		add_child(sound)
		sound.play()
		
		#sound.connect("finsihed",sound,"queue_free")
		GlobalSoundManager.sound_sequence.append(chords[button_name])
	print("Button Pressed:" + button_name)
	#print(GlobalSoundManager.sound_sequence)

func _add_animation(animation_name):
	animation_queue.append(animation_name)
	print("Added ")


func _on_perform_pressed():
	if GlobalSoundManager.sound_sequence.size()>0:
		#print(GlobalSoundManager.sound_sequence)
		get_tree().change_scene_to_file("res://Performance.tscn")
	pass # Replace with function body.


func _on_reset_pressed():
	GlobalSoundManager.sound_sequence.clear()
	print("Sequence Clear")
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	pass # Replace with function body.
