extends Label

var t = 0 #start time t_0=0

# UPDATE PENDULUM RUNTIME
func _process(delta):
	t += delta
	text = "Time: " + String(stepify(t,0.01)) + " s"
