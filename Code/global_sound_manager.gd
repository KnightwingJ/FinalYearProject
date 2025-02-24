extends Node

signal sound_changed(sound_name:String)

var sound_sequence=[] # Store the sequence gloablly
var performance_scene:PackedScene = preload("res://Performance.tscn")

var current_player: AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
var current_audio_player = null
var current_index = 0

var global_volume=0
var global_pitch=1.0



func play_next_sound():
	if sound_sequence.is_empty():
		print("Sequnce Empty")
		return
	if current_index >= sound_sequence.size():
		print("Restart Sequnce")
		current_index = 0
	var audio_stream = sound_sequence[current_index]
	var sound_player = AudioStreamPlayer.new()
	sound_player.stream = audio_stream
	sound_player.volume_db=global_volume
	sound_player.pitch_scale=global_pitch
	add_child(sound_player)
			
			 # Set it as the current player
	current_audio_player = sound_player
	var sound = sound_sequence[current_index].resource_path.get_file().get_basename()

	sound_player.play()
	print("Playing sound:", sound)

	emit_signal("sound_changed",sound)
		# Connect finished signal
	sound_player.connect("finished", Callable(self, "_on_sound_finished"))


func _on_sound_finished():
	if current_audio_player:
		#emit_signal("sound_changed",sound)
		current_audio_player.queue_free()  # Cleanup the finished player
	current_index += 1
	play_next_sound()
func switch_to_playback_scene():
	sound_sequence.clear()
	current_index = 0
	if current_audio_player:
		current_audio_player.queue_free()
	if get_tree().current_scene:
		get_tree().current_scene.queue_free()
	var new_scene=performance_scene.instantiate()
	get_tree().root.add_child(new_scene)

func set_global_volume(value):
	global_volume=value
	if current_audio_player:
		current_audio_player.volume_db = global_volume

func set_global_pitch(value):
	global_pitch=value
	if current_audio_player:
		current_audio_player.pitch_scale = global_pitch

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
