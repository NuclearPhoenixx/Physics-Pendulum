extends LineEdit

onready var main = get_tree().get_root().get_node("Main")
onready var pendulum = main.get_node("CenterContainer/Pendulum")

# UPDATE PENDULUM LENGTH
func _on_Length_text_entered(new_text):
	var a = float(new_text)
	pendulum.l = a
	pendulum.updatePhi()
	
	main.saveConfig("L", a)
