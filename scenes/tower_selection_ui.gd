extends Control

@onready var base_timer = $BaseTimer
@onready var base_label = $BaseLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_timer.stop()
	base_label.hide()
	#base_timer.start()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.grid_clicked and base_timer.is_stopped():
		base_label.show()
		base_timer.start()
		Globals.base_timer_started = true
		Globals.grid_clicked = false
	base_label.text = str(time_left())
	if time_left() < 0.1:
		base_timer.stop()
		base_label.hide()
		Globals.base_timer_started = false

	
func time_left(): 
	#snappedf rounds floats
	#time_left gives timer node countdown to 8 decimal places in seconds
	var decimal_second = snappedf(base_timer.time_left,0.1)
	return decimal_second
	

func _on_button_pressed() -> void:
	Globals.button_clicked = true
		

func _on_timer_timeout() -> void:
	pass
