extends Control

func _on_PlayAgain_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().paused = false
			get_tree().reload_current_scene()


func _on_BackMenu_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().paused = false
			get_tree().change_scene("res://src/UserInterface/FirstMenu/FirstMenu.tscn")


func _on_BackLevel_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.is_pressed():
# warning-ignore:return_value_discarded
			get_tree().paused = false
			get_tree().change_scene("res://src/UserInterface/Loby/Loby.tscn")



