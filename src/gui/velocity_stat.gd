extends Label

onready var pendulum = get_tree().get_root().get_node("Main/CenterContainer/Pendulum")

# UPDATE VELOCITY OF THE PENDULUM TIP
func _process(delta):
	text = "Tip velocity: " + String(stepify(-pendulum.phi_first * pendulum.l,0.01)) + " m/s"
