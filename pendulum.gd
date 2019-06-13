extends Line2D

# PENDULUM CHANGING VARIABLES
var phi = PI #starting angle of the pendulum
var phi_first = 0 #starting angular velocity of the pendulum
# STATIC VARIABLES
var l = 2 #length of the pendulum; 1/100 of the pendulum graphic
var g = 9.81 #m/s^2, gravitational acceleration
var gamma = 0.1 #damping ratio to take friction into account

# INIT FUNCTION
func _ready():
	updatePhi() #initial set correct angle

# FUNCTION TO UPDATE PHI
func updatePhi(a=phi):
	var offset = 5*PI/2 #offset factor to correct angles
	var graphRel = 100 #The actual pendulum graph will be bigger by this factor than L
	
	var newVector = Vector2(l * cos(a + offset) * graphRel, l * sin(a + offset) * graphRel)
	set_point_position(1, newVector)

# COMPUTE SECOND DERIVATIVE OF PHI BASED ON THE DIFFERENTIAL EQUATION
func phiSecond(a, ao):
	return ( - g / l * sin(a) - gamma * ao )

# UPDATE PHI EACH FRAME
func _physics_process(delta):
	phi += phi_first * delta
	phi_first += phiSecond(phi, phi_first) * delta #phi_second * delta
	
	updatePhi()
