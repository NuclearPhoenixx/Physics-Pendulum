extends Line2D

onready var main = get_tree().get_root().get_node("Main")
onready var pendulum = main.get_node("CenterContainer/Pendulum")
onready var amplitude = main.get_node("ControlGUI/Settings/Angle")

var SPEED = 0.5 #moving speed of the graph

# RE-DRAW THE WHOLE GRAPH
func update_graph():
	var i = 0
	
	while i < get_point_count(): #re-draw all points with time
		var position = get_point_position(i) + Vector2(-SPEED,0) #compute new t coordinate
		var window = OS.window_size.x - 30
		
		if abs(position.x) > window: #remove all points outside of the window - garbage collection
			remove_point(i)
		else:
			set_point_position(i, position)
		
		i += 1

# MOVE THE GRAPH EACH FRAME TO THE LEFT
func _physics_process(delta):
	update_graph() #re-draw the graph

# ADD NEW DATA POINTS EVERY TIMER INTERVAL TO PREVENT LAG
func _on_Timer_timeout():
	var factor = 100 / (2 * abs(float(amplitude.text) * PI / 180)) #compute factor so that graph is same size for every amplitude
	var new_point = Vector2(0, pendulum.phi * factor) #update point position with new data
	add_point(new_point)
