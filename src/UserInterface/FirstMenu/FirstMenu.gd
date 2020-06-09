extends Control


var next_scene = "res://src/Map/MapTemplate.tscn"
var setting_scene = "res://src/UserInterface/Settings/Settings.tscn"

func _on_TouchPlay_pressed() -> void:
	get_tree().change_scene(next_scene)


func _on_TouchQuit_pressed() -> void:
	get_tree().quit()


func _on_TouchSettings_pressed() -> void:
	get_tree().change_scene(setting_scene)
