extends Control


var next_scene = "res://src/UserInterface/Loby/Loby.tscn"
var setting_scene = "res://src/UserInterface/Settings/Settings.tscn"

func _on_TouchPlay_pressed() -> void:
	$Menu/TouchPlay.position.y += 2
# warning-ignore:return_value_discarded
	get_tree().change_scene(next_scene)


func _on_TouchQuit_pressed() -> void:
	$Menu/TouchQuit.position.y += 2
	get_tree().quit()


func _on_TouchSettings_pressed() -> void:
	$Menu/TouchSettings.position.y += 2
# warning-ignore:return_value_discarded
	get_tree().change_scene(setting_scene)
