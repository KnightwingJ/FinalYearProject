var bpm = 120  # Beats per minute
var current_step = 0  # Tracks the current step being played
var steps = 16
var timer = Timer.new()

func _ready():
	timer.wait_time = 60.0 / bpm  # Calculate time per step
	#timer.connect("timeout", self, "_on_timer_timeout")
	#add_child(timer)
	timer.start()

func _on_timer_timeout():
	# Highlight the current step or give visual feedback
	#for track in get_children():
		#if track.is_step_active(current_step):  # A custom method to check step activation
			#track.play_sound()
	
	current_step = (current_step + 1) % steps  # Move to the next step

func _process(delta):
	pass
