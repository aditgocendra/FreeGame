extends Control

onready var container_setting = $SettingContainer

onready var sett_fps = preload("res://src/UserInterface/SubSettings/FPSsetting/SettingFPS.tscn").instance()
onready var sett_sound = preload("res://src/UserInterface/SubSettings/SoundSetting/SoundSettings.tscn").instance() 
onready var sett_control = preload("res://src/UserInterface/SubSettings/ControlUISetting/ControlUISetting.tscn").instance()

var child_label
var child_remove

func _on_TouchFPS_pressed() -> void:
	$AudioClickSett.play()
	child_remove = container_setting.get_child(0)
	child_label = child_remove.get_node("LabelSett")
	var label_sett =  sett_fps.get_node("LabelSett").text
	if child_label.text != label_sett:
		container_setting.remove_child(child_remove)
		container_setting.add_child(sett_fps)



func _on_TouchSound_pressed() -> void:
	$AudioClickSett.play()
	child_remove = container_setting.get_child(0)
	child_label = child_remove.get_node("LabelSett")
	var label_sett =  sett_sound.get_node("LabelSett").text
	if child_label.text != label_sett:
		container_setting.remove_child(child_remove)
		container_setting.add_child(sett_sound)


func _on_TouchBack_pressed() -> void:
	$AudioClickSett.play()
	var back_scene = "res://src/UserInterface/FirstMenu/FirstMenu.tscn"
# warning-ignore:return_value_discarded
	get_tree().change_scene(back_scene)


func _on_TouchControl_pressed() -> void:
	$AudioClickSett.play()
	child_remove = container_setting.get_child(0)
	child_label = child_remove.get_node("LabelSett")
	var label_sett =  sett_control.get_node("LabelSett").text
	if child_label.text != label_sett:
		container_setting.remove_child(child_remove)
		container_setting.add_child(sett_control)



