extends Control

var _is_paused: bool = false:
	set = set_paused

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		_is_paused = !_is_paused
		
		
func set_paused(value:bool) ->void:
	_is_paused = value
	get_tree().paused = _is_paused
	visible = _is_paused
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_resume_pressed():
	_is_paused = false
	
func _on_quit_pressed():
	get_tree().quit()
