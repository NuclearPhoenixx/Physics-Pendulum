extends Button

# ON LOAD STOP SIMULATION
func _ready():
	get_tree().paused = true

# SIMULATION TIME CONTROL
func _toggled(button_pressed):
	get_tree().paused = !button_pressed
	
	if button_pressed:
		text = "STOP"
	else:
		text = "START"
