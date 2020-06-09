extends CanvasLayer


var data = Database.loadData()

onready var touch_left = $LeftButtonBot/TouchLeft
onready var touch_right = $LeftButtonBot/TouchRight
onready var touch_up = $LeftButtonBot/TouchUP
onready var touch_attack = $RightButtonBot/TouchAttack
onready var touch_setting = $RightButtonTop/TouchSetting



func _ready() -> void:
	setTranspararencyBtn()

func setTranspararencyBtn():
	var control_ui = data["game_settings"]["control_ui"]
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

func calculate_direction_UI() -> Vector2:
	var direction = Vector2.ZERO 
	
	if touch_left.is_pressed(): 
		direction.x = -1
	elif touch_right.is_pressed():
		direction.x = 1
	elif touch_up.is_pressed():
		
		direction.y = -1
	
	return direction



func _on_TouchLeft_pressed() -> void:
	touch_left.position.y += 2


func _on_TouchRight_pressed() -> void:
	touch_right.position.y += 2


func _on_TouchUP_pressed() -> void:
	touch_up.position.y += 2


func _on_TouchAttack_pressed() -> void:
	touch_attack.position.y += 2


func _on_TouchSetting_pressed() -> void:
	touch_setting.position.y += 2


func _on_TouchLeft_released() -> void:
	touch_left.position.y -= 2


func _on_TouchUP_released() -> void:
	touch_up.position.y -= 2


func _on_TouchRight_released() -> void:
	touch_right.position.y -= 2


func _on_TouchAttack_released() -> void:
	touch_attack.position.y -= 2


func _on_TouchSetting_released() -> void:
	touch_setting.position.y -= 2
