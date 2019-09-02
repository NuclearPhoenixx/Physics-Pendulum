extends Line2D

# PENDULUM CHANGING VARIABLES
var phi = PI #starting angle of the pendulum
var phi_first = 0 #starting angular velocity of the pendulum
# STATIC VARIABLES
var l = 2 #length of the pendulum; 1/100 of the pendulum graphic
var g = 9.81 #m/s^2, gravitational acceleration
var gamma = 0.1 #damping ratio to take friction into account

export(Color) var weight_color = Color(1,1,1,1)
export(int) var weight_radius = 8
var new_vector = Vector2()

# INIT FUNCTION
func _ready():
	updatePhi() #initial set correct angle

# DRAW THE PENDULUM WEIGHTED TIP
func _draw():
	draw_circle(new_vector, weight_radius, weight_color)

# FUNCTION TO UPDATE PHI
func updatePhi(a=phi):
	var offset = 5*PI/2 #offset factor to correct angles
	var graphRel = 100 #The actual pendulum graph will be bigger by this factor than L
	
	new_vector = Vector2(l * cos(a + offset) * graphRel, l * sin(a + offset) * graphRel)
	set_point_position(1, new_vector)

# COMPUTE SECOND DERIVATIVE OF PHI BASED ON THE DIFFERENTIAL EQUATION
func phiSecond(a, ao):
	return ( - g / l * sin(a) - gamma * ao )

# UPDATE PHI EACH FRAME
func _physics_process(delta):
	phi += phi_first * delta
	phi_first += phiSecond(phi, phi_first) * delta #phi_second * delta
	
	updatePhi()
	update()
