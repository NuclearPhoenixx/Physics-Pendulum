extends Button

onready var time_stat = get_tree().get_root().get_node("Node2D/StatHUD/Time")

# ON LOAD STOP SIMULATION
func _ready():
	get_tree().paused = true
	time_stat.set_process(false)

# SIMULATION TIME CONTROL
func _toggled(button_pressed):
	get_tree().paused = !button_pressed
	time_stat.set_process(button_pressed)
	
	if button_pressed:
		self.text = "STOP"
	else:
		self.text = "START"
