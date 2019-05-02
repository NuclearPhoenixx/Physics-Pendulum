extends Control

# STANDARD VALUES
onready var config = ConfigFile.new()
var path = "res://user.cfg"
var section = "Initial Values"

# GET NODES INIT
onready var angleSet = get_node("CtrlHUD/Settings/Angle")
onready var LengthSet = get_node("CtrlHUD/Settings/Length")
onready var VelocitySet = get_node("CtrlHUD/Settings/Velocity")
onready var DampSet = get_node("CtrlHUD/Settings/Damp")
onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")

# STANDARD VARIABLES
var phi = PI / 2 #starting angle of the pendulum
var v_0 = 0 #starting angular velocity of the pendulum
var L = 2 #length of the pendulum; 1/100 of the pendulum graphic
var gamma = 0.1 #damping ratio to take friction into account

# WHEN READY LOAD CONFIG AND APPLY VALUES
func _ready():
	config.load(path)
	
	var a = config.get_value(section, "phi_0", phi)
	var b = config.get_value(section, "L", L)
	var c = config.get_value(section, "v_0", v_0)
	var d = config.get_value(section, "gamma", gamma)
	
	angleSet.text = String(stepify(a * 180 / PI, 0.01))
	pendulum.phi = a
	LengthSet.text = String(b)
	pendulum.L = b
	pendulum.updatePhi(pendulum.phi)
	VelocitySet.text = String(c)
	pendulum.phi_first = - c / pendulum.L
	DampSet.text = String(d)
	pendulum.gamma = d

# SAVE A VALUE TO THE CONFIG
func saveConfig(key, value):
	config.set_value(section, key, value)
	config.save(path)
