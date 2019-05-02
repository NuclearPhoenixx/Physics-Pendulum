extends LineEdit

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")
onready var main = get_tree().get_root().get_node("Node2D")

# UPDATE DAMPING FACTOR
func _on_Damp_text_entered(new_text):
	var a = float(new_text)
	pendulum.gamma = a
	
	main.saveConfig("gamma", a)
