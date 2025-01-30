extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_option_button_item_selected(index: int) -> void:
	Variables.instrument=$OptionButton.get_item_text(index)
	pass # Replace with function body.


func _on_h_slider_value_changed(value):
	$slider_value.text=str($HSlider.value)
	Variables.steps=$HSlider.value
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Sequence.tscn")
	pass # Replace with function body.
