extends Button

onready var time_stat = get_tree().get_root().get_node("Node2D/StatHUD/Time")

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
