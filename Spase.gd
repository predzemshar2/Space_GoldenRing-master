extends Node3D

var a:float
var time:float

# Planets orbit radius, AU/100
const ORBR_MER = 25
const ORBR_VEN = 30
const ORBR_EARTH = 35
const ORBR_MARS = 40
const ORBR_JUP = 52.0441
const ORBR_SAT = 60
const ORBR_URAN = 70
const ORBR_NEPT = 80

# Planets orbit rotation velocity, deg/day
const ORBV_MER = 4.092
const ORBV_VEN = 1.602
const ORBV_EARTH = 0.986
const ORBV_MARS = 0.524
const ORBV_JUP = 0.083
const ORBV_SAT = 0.033
const ORBV_URAN = 0.012
const ORBV_NEPT = 0.006

# Planets own axel angle, deg
const AXLA_MER = 0
const AXLA_VEN = -177.4
const AXLA_EARTH = 23.5
const AXLA_MARS = 25.2
const AXLA_JUP = 3
const AXLA_SAT = 25.3
const AXLA_URAN = -98
const AXLA_NEPT = 29.6

# Plaets own axel rotation velosity, relative to Earth
const AXLV_MER = 0.4
const AXLV_VEN = 0.7
const AXLV_EARTH = 1
const AXLV_MARS = 1.5
const AXLV_JUP = 5.2
const AXLV_SAT = 9.5
const AXLV_URAN = 19.6
const AXLV_NEPT = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var tween = create_tween()
	tween.tween_property($CanvasLayer/Label,"modulate:a",0,5)
#	connect("input_event", self, "on_input_event)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	a = a + delta * 1
	
	# Planet orbit rotation
	$Mercury.position = Vector3(ORBR_MER*sin(a*ORBV_MER),0,ORBR_MER*cos(a*ORBV_MER))
	$Venus.position = Vector3(ORBR_VEN*sin(a*ORBV_VEN),0,ORBR_VEN*cos(a*ORBV_VEN))
	$Earth.position = Vector3(ORBR_EARTH*sin(a*ORBV_EARTH),0,ORBR_EARTH*cos(a*ORBV_EARTH))
	$Mars.position = Vector3(ORBR_MARS*sin(a*ORBV_MARS),0,ORBR_MARS*cos(a*ORBV_MARS))
	$Jupiter.position = Vector3(ORBR_JUP*sin(a*ORBV_JUP),0,ORBR_JUP*cos(a*ORBV_JUP))
	$Saturn.position = Vector3(ORBR_SAT*sin(a*ORBV_SAT),0,ORBR_SAT*cos(a*ORBV_SAT))
	$Uranus.position = Vector3(ORBR_URAN*sin(a*ORBV_URAN),0,ORBR_URAN*cos(a*ORBV_URAN))
	$Neptune.position = Vector3(ORBR_NEPT*sin(a*ORBV_NEPT),0,ORBR_NEPT*cos(a*ORBV_NEPT))


func _on_area_3d_mouse_entered():
	$CanvasLayer/Label.modulate.a = 1
	$CanvasLayer/Label.text = $".".name


func _on_area_3d_mouse_exited():
	$CanvasLayer/Label.text = ""


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		return


func _on_area_3d_mercury_input_event(camera, event, position, normal, shape_idx):
	pass # Replace with function body.


func _on_area_3d_earth_mouse_entered():
	pass # Replace with function body.


func _on_area_3d_earth_mouse_exited():
	pass # Replace with function body.


func _on_area_3d_earth_input_event(camera, event, position, normal, shape_idx):
	pass # Replace with function body.


func _on_area_3d_mercury_mouse_entered():
	pass # Replace with function body.


func _on_area_3d_mercury_mouse_exited():
	pass # Replace with function body.


func _on_area_3d_venus_input_event(camera, event, position, normal, shape_idx):
	pass # Replace with function body.
