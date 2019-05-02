extends LineEdit

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")
onready var main = get_tree().get_root().get_node("Node2D")

# UPDATE v_0 INITIAL VELOCITY
func _on_Velocity_text_entered(new_text):
	var a = float(new_text)
	pendulum.phi_first += - a / pendulum.L
	
	main.saveConfig("v_0", a)
