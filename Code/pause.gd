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

func _on_resume_pressed():
	_is_paused = false
	
func _on_quit_pressed():
	get_tree().quit()


func _on_left_button_pressed(name):
	if name=="by_button":
		_is_paused=!_is_paused
		
	pass # Replace with function body.
