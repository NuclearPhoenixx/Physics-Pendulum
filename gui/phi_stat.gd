extends Label

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")

# UPDATE ANGLE OF PHI IN DEGREES
func _physics_process(delta):
	self.text = "Angle: " + String(stepify(-pendulum.phi * 180 / PI,0.01)) + " °"
