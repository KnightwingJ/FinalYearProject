extends Node

var current_index = 0  # To track the current sound being played.

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalSoundManager.sound_sequence.size() > 0:
		play_next_sound()
	else:
		print("No sounds in the sequence to play.")

func play_next_sound():
	if current_index < GlobalSoundManager.sound_sequence.size():
		var audio_stream = GlobalSoundManager.sound_sequence[current_index]
		var sound_player = AudioStreamPlayer.new()
		sound_player.stream = audio_stream
		add_child(sound_player)
		sound_player.play()

		print("Playing sound:", audio_stream)

		# Connect signal using a Callable
		sound_player.connect("finished", Callable(self, "_on_sound_finished"))
	else:
		print("Finished playing the sequence.")
		current_index = 0  # Reset or stop based on your needs.
		play_next_sound()

func _on_sound_finished():
	current_index += 1
	play_next_sound() # Play the next sound.
