extends Label

onready var pendulum = get_tree().get_root().get_node("Main/CenterContainer/Pendulum")

# UPDATE ANGLE OF PHI IN DEGREES
func _process(delta):
	text = "Angle: " + String(stepify(-pendulum.phi * 180 / PI,0.01)) + " °"
