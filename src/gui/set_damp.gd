extends LineEdit

onready var main = get_tree().get_root().get_node("Main")
onready var pendulum = main.get_node("CenterContainer/Pendulum")

# UPDATE DAMPING FACTOR
func _on_Damp_text_entered(new_text):
	var a = float(new_text)
	pendulum.gamma = a
	
	main.saveConfig("GAMMA", a)
