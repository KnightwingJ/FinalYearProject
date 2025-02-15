extends AnimationPlayer

@onready var animation_player:AnimationPlayer=$"."

var sound_animaiton_map = {
	"e_major":"E Chord",
	"g_major":"G Chord",
	"a_major":"A Chord",
	"c_major":"C Chord"
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#GlobalSoundManager.sound
	GlobalSoundManager.sound_changed.connect(_on_sound_changed)
	pass # Replace with function body.

func _on_sound_changed(sound_name: String):
	if sound_name in sound_animaiton_map:
		#animation_player.play("A Chord")
		animation_player.play(sound_animaiton_map[sound_name])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
