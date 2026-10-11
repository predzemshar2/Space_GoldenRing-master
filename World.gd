extends Node3D

var a=0
var r



# Called when the node enters the scene tree for the first time.
func _ready():
	r = $Mercury.global_position.x
	print("Orbit: ",r)

	var tween = create_tween()
	tween.tween_property($CanvasLayer/Label,"modulate:a",0,5)
#	connect("input_event", self, "on_input_event)
#	$AudioStreamPlayer3D.set_time_position(20) 

func _process(delta):
	a = a+ delta/4
	$Mercury.global_position = Vector3(r*sin(a),0,r*cos(a))
	$Earth.global_position = Vector3(r*sin(a/2),0,r*cos(a/2))
	$Venera.global_position = Vector3(r*sin(a*2),0,r*cos(a*2))
	$Sun.rotate_y(delta/10)


func _on_area_3d_mouse_entered():
	$CanvasLayer/Label.modulate.a =1
	$CanvasLayer/Label.text = "Планета Земля.\n Выберите, чтобы приземлиться"


func _on_area_3d_mouse_exited():
	$CanvasLayer/Label.text =""


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		print("click")
		get_tree().change_scene_to_file("res://location.tscn")


func _on_area_3_dmerc_mouse_entered():
	$CanvasLayer/Label.modulate.a =1
	$CanvasLayer/Label.text = "Планета Меркурий.\n Не обитаема"


func _on_area_3_dven_mouse_entered():
	$CanvasLayer/Label.modulate.a =1
	$CanvasLayer/Label.text = "Планета Венера.\n Не обитаема"
