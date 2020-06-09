extends Control

onready var data = Database.loadData()
onready var check_box = $ShowOrHide/HBoxContainer2/CheckBox
onready var label_on_off = $ShowOrHide/HBoxContainer2/LabelOnOff

func _ready() -> void:
	setFPSLabel()

func setFPSLabel():
	var fps_setting = data["game_settings"]["setting_fps"]
	if fps_setting["FPSlabel"] == true:
		check_box.pressed = true
		label_on_off.text = "On"
	else: 
		check_box.pressed = false
		label_on_off.text = "Off"
 

func _on_CheckBox_pressed() -> void:
	if check_box.pressed == true:
		label_on_off.text = "On"
	else:label_on_off.text = "Off"
