extends LineEdit

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")
onready var main = get_tree().get_root().get_node("Node2D")

# UPDATE PHI_0 INIT ANGLE VALUE
func _on_Angle_text_entered(new_text):
	var a = - float(new_text) * PI / 180
	pendulum.phi = a
	pendulum.updatePhi(a)
	
	main.saveConfig("phi_0", a)
