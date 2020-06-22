extends Control

onready var control_cust = "res://src/UserInterface/SubSettings/CustomControl/CustomControlUI.tscn"

onready var control_ui_check = $VBoxContainer/HBoxControlUI/CheckBox
onready var control_ui_label = $VBoxContainer/HBoxControlUI/LabelOnOff
onready var keyboard_check = $VBoxContainer/HBoxKeyboard/CheckBox
onready var keyboard_label = $VBoxContainer/HBoxKeyboard/LabelOnOff

# database instance
onready var data = Database.loadData()

func _ready() -> void:
	setController()

func _on_Button_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
# warning-ignore:return_value_discarded
		get_tree().change_scene(control_cust)


func setController() -> void:
	var data_controller = data["game_settings"]["game_controller"]
	if data_controller["control"] == true:
		setControlUIOn()
	else: setKeyboardOn()
		

func _on_CheckBox_Keyboard() -> void:
	data["game_settings"]["game_controller"]["control"] = false
	Database.save_data(data)
	setKeyboardOn()

func _on_CheckBox_ControlUI() -> void:
	data["game_settings"]["game_controller"]["control"] = true
	Database.save_data(data)
	setControlUIOn()

func setControlUIOn() -> void:
	control_ui_check.pressed = true
	control_ui_label.text = "ON"
	keyboard_check.pressed = false
	keyboard_label.text = "OFF"

func setKeyboardOn() -> void:
	control_ui_check.pressed = false
	control_ui_label.text = "OFF"
	keyboard_check.pressed = true
	keyboard_label.text = "ON"
