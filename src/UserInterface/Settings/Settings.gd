extends Control

onready var container_setting = $SettingContainer

onready var sett_fps = preload("res://src/UserInterface/SubSettings/FPSsetting/SettingFPS.tscn").instance()
onready var sett_sound = preload("res://src/UserInterface/SubSettings/SoundSetting/SoundSettings.tscn").instance() 

var child_label
var child_remove

func _on_TouchFPS_pressed() -> void:
	child_remove = container_setting.get_child(0)
	child_label = child_remove.get_node("LabelSett")
	var label_sett =  sett_fps.get_node("LabelSett").text
	if child_label.text != label_sett:
		container_setting.remove_child(child_remove)
		container_setting.add_child(sett_fps)



func _on_TouchSound_pressed() -> void:
	child_remove = container_setting.get_child(0)
	child_label = child_remove.get_node("LabelSett")
	var label_sett =  sett_sound.get_node("LabelSett").text
	if child_label.text != label_sett:
		container_setting.remove_child(child_remove)
		container_setting.add_child(sett_sound)


func _on_TouchBack_pressed() -> void:
	var back_scene = "res://src/UserInterface/FirstMenu/FirstMenu.tscn"
	get_tree().change_scene(back_scene)
