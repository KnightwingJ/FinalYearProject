extends AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var animation_name = "mixamo_com"
	
	if has_animation(animation_name):
		play(animation_name)
		print("Animation Found")
	else:
		print("Animation Not Found")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var animation_name = "mixamo_com"
	if is_playing() == false and has_animation(animation_name):
		play(animation_name)
