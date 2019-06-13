extends LineEdit

onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")
onready var main = get_tree().get_root().get_node("Node2D")

# UPDATE PENDULUM LENGTH
func _on_Length_text_entered(new_text):
	var a = float(new_text)
	pendulum.l = a
	pendulum.updatePhi()
	
	main.saveConfig("L", a)
