extends Label

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")

# UPDATE ANGULAR VELOCITY OF THE PENDULUM
func _process(delta):
	text = "Angular velocity: " + String(stepify(-pendulum.phi_first,0.01)) + " rad/s"
