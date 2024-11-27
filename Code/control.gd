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
	$"E Chord".pressed.connect(() -> _on_button_pressed("E Chord"))
	#$"E Chord".connect("pressed",_on_button_pressed,chords["E Chord"])
	$"A Chord".pressed.connect(_on_button_pressed("A Chord"))
	$"D Chord".pressed.connect(_on_button_pressed("D Chord"))
	$"G Chord".pressed.connect(_on_button_pressed("G Chord"))
	$"C Chord".pressed.connect(_on_button_pressed("C Chord"))
	


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
		GlobalSoundManager.sound_sequence.append(button_name)
	print("Button Pressed: %s",% button_name)

func _on_guitar_pressed():
	_add_animation("Guitar")
	
	pass # Replace with function body.

func _add_animation(animation_name):
	animation_queue.append(animation_name)
	print("Added ")
