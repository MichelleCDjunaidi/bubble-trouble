extends Control

@onready var base_timer = $BaseTimer
@onready var base_label = $BaseLabel
@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_timer.stop()
	base_label.hide()
	button.modulate = Color(1,1, 1,1) # Normalized RGBA values
	#base_timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(Globals.grid_clicked and base_timer.is_stopped())
	if Globals.grid_clicked and base_timer.is_stopped():
		#print('adjkladjlkad')
		base_label.show()
		base_timer.start()
		Globals.base_timer_started = true
		Globals.grid_clicked = false
		button.modulate = Color(0.411765, 0.411765, 0.411765, 1) # Normalized RGBA values
	base_label.text = str(time_left())
	
	if time_left() < 0.1:
		base_timer.stop()
		base_label.hide()
		button.modulate = Color(1,1, 1,1) # Normalized RGBA values
		Globals.base_timer_started = false
	#pass

	
func time_left(): 
	#snappedf rounds floats
	#time_left gives timer node countdown to 8 decimal places in seconds
	var decimal_second = snappedf(base_timer.time_left,0.1)
	return decimal_second
	

func _on_button_pressed() -> void:
	Globals.button_clicked = true
		

func _on_base_timer_timeout() -> void:
	pass # Replace with function body.
