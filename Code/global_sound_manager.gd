extends Node

signal sound_changed(sound_name: String)

const POOL_SIZE = 10  # Number of pre-allocated players
var players: Array[AudioStreamPlayer] = []
var sound_sequence: Array = []  # Store the sequence globally
var performance_scene: PackedScene = preload("res://Performance.tscn")

var current_index = 0
var global_volume = 0
var global_bpm = 120

func _ready():
	_initialize_pool()

# **1. Initialize a pool of AudioStreamPlayers**
func _initialize_pool():
	for i in range(POOL_SIZE):
		var player = AudioStreamPlayer.new()
		player.volume_db = global_volume
		player.connect("finished", Callable(self, "_on_sound_finished").bind(player))
		add_child(player)
		players.append(player)

# **2. Get an available AudioStreamPlayer from the pool**
func _get_available_player() -> AudioStreamPlayer:
	for player in players:
		if !player.playing:
			return player
	return null  # No available player (shouldn't happen with a well-sized pool)

# **3. Play the next sound in sequence**
func play_next_sound():
	if sound_sequence.is_empty():
		print("Sequence Empty")
		return

	if current_index >= sound_sequence.size():
		print("Restarting Sequence")
		current_index = 0

	var audio_stream = sound_sequence[current_index]
	var sound_player = _get_available_player()

	if sound_player:
		sound_player.stream = audio_stream
		sound_player.volume_db = global_volume
		sound_player.pitch_scale = global_bpm / 120.0  # Adjust BPM
		sound_player.play()

		var sound_name = sound_sequence[current_index].resource_path.get_file().get_basename()
		print("Playing sound:", sound_name)

		emit_signal("sound_changed", sound_name)

		current_index += 1  # Move to the next sound in sequence

# **4. Handle finished sounds**
func _on_sound_finished(player: AudioStreamPlayer):
	player.stream = null  # Reset the stream for reuse

# **5. Switch to playback scene**
func switch_to_playback_scene():
	sound_sequence.clear()
	current_index = 0

	for player in players:
		player.stop()

	if get_tree().current_scene:
		get_tree().current_scene.queue_free()

	var new_scene = performance_scene.instantiate()
	get_tree().root.add_child(new_scene)

# **6. Set volume globally**
func set_global_volume(value: float):
	global_volume = value
	for player in players:
		player.volume_db = 20.0 * log(max(value, 0.0001))  # Convert linear value to dB

# **7. Set BPM globally**
func set_global_bpm(value: float):
	global_bpm = value
	for player in players:
		if player.playing:
			player.pitch_scale = value / 120.0  # Adjust pitch while keeping relative speed
