extends LineEdit

onready var main = get_tree().get_root().get_node("Main")
onready var pendulum = main.get_node("CenterContainer/Pendulum")

# UPDATE PHI_0 INIT ANGLE VALUE
func _on_Angle_text_entered(new_text):
	var a = - float(new_text) * PI / 180
	pendulum.phi = a
	pendulum.updatePhi()
	
	main.saveConfig("PHI_0", a)
