extends Label

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")

# UPDATE VELOCITY OF THE PENDULUM TIP
func _physics_process(delta):
	self.text = "Tip velocity: " + String(stepify(-pendulum.phi_first * pendulum.L,0.01)) + " m/s"
