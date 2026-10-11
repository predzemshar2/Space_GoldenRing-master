extends Node3D

var a=5
var r
var start_dialog = false



# Called when the node enters the scene tree for the first time.
func _ready():
#	Game.is_end=true
	if Game.is_end:
		$CanvasLayer/Label.modulate.a =1
		$CanvasLayer/Label.text = "УРА! Мы продолжаем исследовать миры!"
		a = 10000
		$CanvasLayer/Button.visible=true
	else:
		_on_button_pressed()
	r = $Mercury.global_position.x
	print("Orbit: ",r)

	var tween = create_tween()
	tween.tween_property($CanvasLayer/Label,"modulate:a",0,5)
#	connect("input_event", self, "on_input_event)


func _process(delta):
	a = a- delta
#	$Mercury.global_position = Vector3(r*sin(a),0,r*cos(a))
#	$Earth.global_position = Vector3(r*sin(a/2),0,r*cos(a/2))
#	$Venera.global_position = Vector3(r*sin(a*2),0,r*cos(a*2))
#	$Sun.rotate_y(delta/10)
	if a>0:
		$Camera3D.rotation.y=a
	else:
		_start_dialog()
		
	


func _start_dialog():
	if not start_dialog:
		start_dialog = true
		$CanvasLayer/Label.modulate.a =1
		$CanvasLayer/Label.text = "Капитан: Что случислоь?\nРобот: Сломалась система галактического\n полета, требуется ремонт!\nКапитан: Кстати,что это за звук?\nРобот: Поймал местное радио.\nЗаодно выучил язык)"
		var tween = create_tween()
		tween.tween_property($CanvasLayer/Label,"modulate:a",0,10)
		await get_tree().create_timer(10).timeout
		get_tree().change_scene_to_file("res://world0.tscn")
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


func _on_button_pressed():
	$CanvasLayer/Button.visible=false
	Game.reset()
	a = Game.time_crush
	$CanvasLayer/Label.modulate.a =1
	$CanvasLayer/Label.text = "Мы исследователи галактики"
