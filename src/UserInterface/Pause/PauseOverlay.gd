extends ColorRect

func _on_BackGame_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		$".".hide()
		get_tree().paused = false


func _on_Quit_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		get_tree().quit()


func _on_BackMenu_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		get_tree().paused = false
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/UserInterface/FirstMenu/FirstMenu.tscn")


func _on_BackLevel_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		get_tree().paused = false
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/UserInterface/Loby/Loby.tscn")
