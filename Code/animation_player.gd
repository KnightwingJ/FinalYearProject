extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	var animation=$"."
	
	
	if animation:
		animation.play("mixamo_com")
		print("Animation Fund")
	else:
		print("Animation Not Found")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
