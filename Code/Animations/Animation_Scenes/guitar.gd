extends Node3D

@onready var animation_tree = $AnimationTree

enum {IDLE,ACHORD,GCHORD,ECHORD,CCHORD}

var currAnim = IDLE

var sound_animaiton_map = {
	"e_major":ECHORD,
	"e_menor":ECHORD,
	"g_major":GCHORD,
	"g_menor":GCHORD,
	"a_major":ACHORD,
	"a_menor":ACHORD,
	"c_major":CCHORD,
	"d_major":CCHORD,
	"d_menor":CCHORD
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#GlobalSoundManager.sound
	GlobalSoundManager.sound_changed.connect(_on_sound_changed)
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	handle_animations()

func _on_sound_changed(sound_name: String):
	if sound_name in sound_animaiton_map:
		#animation_player.play("A Chord")
		#animation_player.play(sound_animaiton_map[sound_name])
		currAnim=sound_animaiton_map[sound_name]
	else:
		currAnim=IDLE
func handle_animations():
	match currAnim:
		IDLE:
			animation_tree.set("parameters/Transition/transition_request","Idle")
		ACHORD:
			animation_tree.set("parameters/Transition/transition_request","A Chord")
		GCHORD:
			animation_tree.set("parameters/Transition/transition_request","G Chord")
		ECHORD:
			animation_tree.set("parameters/Transition/transition_request","E Chord")
		CCHORD:
			animation_tree.set("parameters/Transition/transition_request","C Chord")
	pass
