extends Marker3D

var samples:Array
var players:Array

@export var font:Font 

var sequence = []
var file_names = []

@export var path_str = "res://Sounds/" 
@export var pad_scene:PackedScene

var steps = Variables.steps

var rows:int
var cols:int
var instrument = Variables.instrument
#Variables.instrument

func initialise_sequence(rows, cols):
	for i in range(rows):
		var row = []
		for j in range(cols):
			row.append(false)
		sequence.append(row)
	self.rows = rows
	self.cols = cols

func _ready():
	#Variables.instrument="Guitar"
	print("Running on platform: ", OS.get_name())
	print("Resource path base: ", OS.get_executable_path().get_base_dir())
	print("The current instrument is "+Variables.instrument)
	print(steps)
	load_samples()
	initialise_sequence(samples.size(), steps)
	make_sequencer()
	
	for i in range(50):
		var asp = AudioStreamPlayer.new()
		add_child(asp)
		players.push_back(asp)

var asp_index = 0

func print_sequence():
	print()
	for row in range(samples.size() -1, -1, -1):
		var s = ""
		for col in range(steps):
			s += "1" if sequence[row][col] else "0" 
		print(s)
		
func play_sample(e, i):
	
	print("play sample:" + str(i))
	var p:AudioStream = samples[i]
	var asp = players[asp_index]
	asp.stream = p
	asp.play()
	asp_index = (asp_index + 1) % players.size()

func toggle(e, row, col):
	print("toggle " + str(row) + " " + str(col))
	sequence[row][col] = ! sequence[row][col]
	play_sample(0, row)
	print_sequence()
	

var s = 0.1
var spacer = 1.5

func make_sequencer():	
	print(steps)
	for col in range(steps):		
		
		for row in range(samples.size()):
			var label = Label3D.new()
			label.text=file_names[row] 
			label.font = font
			label.position = Vector3(s * -6 * spacer, s * row * spacer,0)
			add_child(label)
			var pad = pad_scene.instantiate()
			
			var p = Vector3(s * col * spacer, s * row * spacer, 0)
			pad.position = p		
			pad.rotation = rotation
			
			pad.area_entered.connect(toggle.bind(row, col))
			#pad.input_event.connect(toggle.bind(row,col))
			add_child(pad)
			pad.name=str(samples[row])
			
func load_samples():
	var full_path=path_str+instrument
	print(full_path)
	var dir = DirAccess.open(full_path)
	print(dir)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("NO DIR")
			if file_name.ends_with('.wav.import') or file_name.ends_with('.mp3.import'):			
				file_name = file_name.left(len(file_name) - len(".import"))
				var stream = load(full_path + "/" + file_name)
				stream.resource_name = file_name
				samples.push_back(stream)
				file_names.push_back(file_name)
				# $AudioStreamPlayer.play()
				# break
			else:
				print("NO Music")
			file_name = dir.get_next()	
	else:
		print("Failed to load files")
		print("Error code: ", DirAccess.get_open_error())

func play_step(col):
	var p = Vector3(s * col * spacer, s * -1 * spacer, 0)
			
	$timer_ball.position = p
	for row in range(rows):
		if sequence[row][col]:
			play_sample(0, row)

var step:int = 0

func _on_timer_timeout() -> void:
	print("step " + str(step))
	play_step(step)
	step = (step + 1) % steps
	pass # Replace with function body.


func _on_start_stop_area_entered(area: Area3D) -> void:
	if $Timer.is_stopped():
		$Timer.start()
	else:
		$Timer.stop()
	pass # Replace with function body.

func add_to_global():
	var step_sounds=[] #Sounds for each step
	for col in range(cols): #Loop through each step
		for row in range(rows): #Loop through each row
			if sequence[row][col]: #Check if step is toggled
				step_sounds.append(samples[row]) #Add corresponding audio
	for steps in step_sounds:
		GlobalSoundManager.sound_sequence.append(steps) #Add to Global Sound Manager


func _on_perform_area_entered(area: Area3D) -> void:
	add_to_global()
	if GlobalSoundManager.sound_sequence.size()>0:
		print(GlobalSoundManager.sound_sequence)
		get_tree().change_scene_to_file("res://Performance.tscn")
	else:
		print("Empty")
	pass # Replace with function body.
