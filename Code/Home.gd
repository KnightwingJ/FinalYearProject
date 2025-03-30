extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_home_pressed():
	GlobalSoundManager.sound_sequence=[]
	get_tree().change_scene_to_file("res://Sequence.tscn")
	pass # Replace with function body.

func _on_volume_value_changed(value: float) -> void:
	if GlobalSoundManager and GlobalSoundManager.current_audio_player:
		GlobalSoundManager.set_global_volume(value)
		print("Volume set to:", value)
	pass # Replace with function body.


func _on_bpm_value_changed(value: float) -> void:
	if GlobalSoundManager and GlobalSoundManager.current_audio_player:
		GlobalSoundManager.set_global_bpm(value)
		print("BPM set to:", value)
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().quit()
