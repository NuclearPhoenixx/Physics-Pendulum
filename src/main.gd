extends Control

onready var config = ConfigFile.new()
# CONFIG STANDARD VALUES
var PATH = "user://settings.cfg"
var SECTION = "Initial Values"

# GET NODES INIT
onready var Settings = get_node("ControlGUI/Settings")
onready var AngleSet = Settings.get_node("Angle")
onready var LengthSet = Settings.get_node("Length")
onready var VelocitySet = Settings.get_node("Velocity")
onready var DampSet = Settings.get_node("Damp")
onready var Pendulum = get_node("CenterContainer/Pendulum")

# STANDARD VARIABLES
var PHI = PI / 2 #starting angle of the pendulum
var V_0 = 0 #starting angular velocity of the pendulum
var L = 2 #length of the pendulum; 1/100 of the pendulum graphic
var GAMMA = 0.1 #damping ratio to take friction into account

# WHEN READY LOAD CONFIG AND APPLY VALUES
func _ready():
	config.load(PATH)
	
	var a = config.get_value(SECTION, "PHI_0", PHI)
	var b = config.get_value(SECTION, "L", L)
	var c = config.get_value(SECTION, "V_0", V_0)
	var d = config.get_value(SECTION, "GAMMA", GAMMA)
	
	AngleSet.text = String(stepify(- a * 180 / PI, 0.01))
	Pendulum.phi = a
	LengthSet.text = String(b)
	Pendulum.l = b
	Pendulum.updatePhi()
	VelocitySet.text = String(c)
	Pendulum.phi_first = - c / Pendulum.l
	DampSet.text = String(d)
	Pendulum.gamma = d

# SAVE A VALUE TO THE CONFIG
func saveConfig(key, value):
	config.set_value(SECTION, key, value)
	config.save(PATH)
