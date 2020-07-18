extends CanvasLayer

var data = Database.loadData()

onready var touch_left = $TouchLeft
onready var touch_right = $TouchRight
onready var touch_up = $TouchUP
onready var touch_attack = $TouchAttack
onready var touch_setting = $TouchSetting

var attack_ui = false
var jump_ui = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if $PauseOverlay.show() == true:
			$PauseOverlay.hide()
		else: $PauseOverlay.show()

func _ready() -> void:
	self.setTranspararencyBtn(getSettingControl())
	self.setPosBtn(getSettingControl())


func setTranspararencyBtn(new_data):
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
	
	
func getSettingControl():
	var control_data  = data["game_settings"]["control_ui"]
	return control_data

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
	jump_ui = true
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
	attack_ui = true
	touch_attack.position.y -= 2


func _on_TouchSetting_released() -> void:
	touch_setting.position.y -= 2
	$PauseOverlay.show()
	get_tree().paused = true



