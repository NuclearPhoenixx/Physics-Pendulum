extends Button

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")
onready var time_stat = get_tree().get_root().get_node("Node2D/StatHUD/Time")

# ON LOAD STOP SIMULATION
func _ready():
	pendulum.set_physics_process(false)
	time_stat.set_physics_process(false)

# SIMULATION TIME CONTROL
func _toggled(button_pressed):
	pendulum.set_physics_process(button_pressed)
	time_stat.set_physics_process(button_pressed)
	if button_pressed:
		self.text = "STOP"
	else:
		self.text = "START"
