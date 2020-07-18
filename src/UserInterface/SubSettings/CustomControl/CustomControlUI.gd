extends Control

#component ready
onready var label_x = $Panel/VBoxContainer/HBoxPos/LabelX
onready var label_y = $Panel/VBoxContainer/HBoxPos/LabelY
onready var slider_trans = $Panel/VBoxContainer/HBoxEditTrans/HSlider

#button ready---------------------------------------
onready var touch_left = $ControlCust/TouchLeft
onready var touch_right = $ControlCust/TouchRight
onready var touch_up = $ControlCust/TouchUP
onready var touch_attack = $ControlCust/TouchAttack
onready var touch_setting = $ControlCust/TouchSetting


onready var data = Database.loadData()

var pos_x = 0
var pos_y = 0

var current_touch = null

func _ready() -> void:
	label_x.set_text("X :  %d" % [pos_x])
	label_y.set_text("X :  %d" % [pos_y])
	
	self.setTranspararencyBtn(getSettingControl())
	self.setPosBtn(getSettingControl())
	self.setScaleBtn(getSettingControl())



func getSettingControl():
	var control_data  = data["game_settings"]["control_ui"]
	return control_data

func setTranspararencyBtn(new_data) -> void:
	var control_ui = new_data
	var colorTouchLeft = control_ui["touch_left"]["modulate"]
	var colorTouchRight = control_ui["touch_right"]["modulate"]
	var colorTouchUP = control_ui["touch_up"]["modulate"]
	var colorTouchAttack = control_ui["touch_attack"]["modulate"]
	var colorTouchSetting = control_ui["touch_setting"]["modulate"]
	
	touch_left.modulate = Color(colorTouchLeft["r"],colorTouchLeft["g"],colorTouchLeft["b"],colorTouchLeft["a"])
	touch_right.modulate = Color(colorTouchRight["r"],colorTouchRight["g"],colorTouchRight["b"],colorTouchRight["a"])
	touch_up.modulate = Color(colorTouchUP["r"],colorTouchUP["g"],colorTouchUP["b"],colorTouchUP["a"])
	touch_attack.modulate = Color(colorTouchAttack["r"],colorTouchAttack["g"],colorTouchAttack["b"],colorTouchAttack["a"])
	touch_setting.modulate = Color(colorTouchSetting["r"],colorTouchSetting["g"],colorTouchSetting["b"],colorTouchSetting["a"])

func setPosBtn(new_data) -> void:
	var control_ui = new_data
	var posTouchLeft = control_ui["touch_left"]["position"]
	var posTouchRight = control_ui["touch_right"]["position"]
	var posTouchUP = control_ui["touch_up"]["position"]
	var posTouchAttack = control_ui["touch_attack"]["position"]
	var posTouchSetting = control_ui["touch_setting"]["position"]
	
	touch_left.position = Vector2(posTouchLeft["x"],posTouchLeft["y"])
	touch_right.position = Vector2(posTouchRight["x"],posTouchRight["y"])
	touch_up.position = Vector2(posTouchUP["x"],posTouchUP["y"])
	touch_attack.position = Vector2(posTouchAttack["x"],posTouchAttack["y"])
	touch_setting.position = Vector2(posTouchSetting["x"],posTouchSetting["y"])

func setScaleBtn(new_data) -> void:
	var control_ui = new_data
	var posTouchLeft = control_ui["touch_left"]["scale"]
	var posTouchRight = control_ui["touch_right"]["scale"]
	var posTouchUP = control_ui["touch_up"]["scale"]
	var posTouchAttack = control_ui["touch_attack"]["scale"]
	var posTouchSetting = control_ui["touch_setting"]["scale"]
	
	touch_left.scale = Vector2(posTouchLeft["x"],posTouchLeft["y"])
	touch_right.scale = Vector2(posTouchRight["x"],posTouchRight["y"])
	touch_up.scale = Vector2(posTouchUP["x"],posTouchUP["y"])
	touch_attack.scale = Vector2(posTouchAttack["x"],posTouchAttack["y"])
	touch_setting.scale = Vector2(posTouchSetting["x"],posTouchSetting["y"])


func setCustPos(new_pos : Vector2) -> void :
	label_x.set_text("X :  %d" % [new_pos.x])
	label_y.set_text("X :  %d" % [new_pos.y])


func setCustTrans(new_modulate, node) -> void:
	current_touch = node
	slider_trans.value = new_modulate.a * 100
	

func _on_ResetBtn_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		setDefaultControl()


func _on_SaveBtn_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		setNewControl()


func setDefaultControl() -> void:
	var default_data = Database.default_data
	var default_control = default_data["game_settings"]["control_ui"]
	
	saveNewCustControl(default_control)
	setTranspararencyBtn(default_control)
	setPosBtn(default_control)
	setScaleBtn(default_control)


func setNewControl() -> void :
	var new_set_control = null
	new_set_control = {
		touch_left = {
			position = {
				x = touch_left.position.x,
				y = touch_left.position.y
			},
			modulate = {
				r = touch_left.modulate.r,
				g = touch_left.modulate.g,
				b = touch_left.modulate.b,
				a = touch_left.modulate.a
			},
			scale = {
				x = touch_left.scale.x,
				y = touch_left.scale.y
			}
		},
		touch_right = {
			position = {
				x = touch_right.position.x,
				y = touch_right.position.y
			},
			modulate = {
				r = touch_right.modulate.r,
				g = touch_right.modulate.g,
				b = touch_right.modulate.b,
				a = touch_right.modulate.a
			},
			scale = {
				x = touch_right.scale.x,
				y = touch_right.scale.y
			}
		},
		touch_up = {
			position = {
				x = touch_up.position.x,
				y = touch_up.position.y
			},
			modulate = {
				r = touch_up.modulate.r,
				g = touch_up.modulate.g,
				b = touch_up.modulate.b,
				a = touch_up.modulate.a
			},
			scale = {
				x = touch_up.scale.x,
				y = touch_up.scale.y
			}
		},
		touch_attack = {
			position = {
				x = touch_attack.position.x,
				y = touch_attack.position.y
			},
			modulate = {
				r = touch_attack.modulate.r,
				g = touch_attack.modulate.g,
				b = touch_attack.modulate.b,
				a = touch_attack.modulate.a
			},
			scale = {
				x = touch_attack.scale.x,
				y = touch_attack.scale.y
			}
		},
		touch_setting = {
			position = {
				x = touch_setting.position.x,
				y = touch_setting.position.y
			},
			modulate = {
				r = touch_setting.modulate.r,
				g = touch_setting.modulate.g,
				b = touch_setting.modulate.b,
				a = touch_setting.modulate.a
			},
			scale = {
				x = touch_setting.scale.x,
				y = touch_setting.scale.y
			}
		}
	}
	
	saveNewCustControl(new_set_control)
	setTranspararencyBtn(new_set_control)
	setPosBtn(new_set_control)
	setScaleBtn(new_set_control)


func saveNewCustControl(new_control) -> void:
	data["game_settings"]["control_ui"] = new_control
	Database.save_data(data)
	


func _on_ExitBtn_gui_input(event: InputEvent) -> void:
	var new_scene = "res://src/UserInterface/Settings/Settings.tscn"
	if event is InputEventScreenTouch:
# warning-ignore:return_value_discarded
		get_tree().change_scene(new_scene)


func _on_Scale_value_changed(value):
	TouchCustom.new().changeScale(value, current_touch)

func _on_HSlider_value_changed(value: float) -> void:
	value = value / 100
	TouchCustom.new().changeTrans(value, current_touch)
