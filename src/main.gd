extends Control

onready var config = ConfigFile.new()
# CONFIG STANDARD VALUES
var PATH = "user://settings.cfg"
var SECTION = "Initial Values"

# GET NODES INIT
onready var angleSet = get_node("CtrlHUD/Settings/Angle")
onready var LengthSet = get_node("CtrlHUD/Settings/Length")
onready var VelocitySet = get_node("CtrlHUD/Settings/Velocity")
onready var DampSet = get_node("CtrlHUD/Settings/Damp")
onready var pendulum = get_tree().get_root().get_node("Node2D/CenterContainer/Pendulum")

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
	
	angleSet.text = String(stepify(- a * 180 / PI, 0.01))
	pendulum.phi = a
	LengthSet.text = String(b)
	pendulum.l = b
	pendulum.updatePhi()
	VelocitySet.text = String(c)
	pendulum.phi_first = - c / pendulum.l
	DampSet.text = String(d)
	pendulum.gamma = d

# SAVE A VALUE TO THE CONFIG
func saveConfig(key, value):
	config.set_value(SECTION, key, value)
	config.save(PATH)
