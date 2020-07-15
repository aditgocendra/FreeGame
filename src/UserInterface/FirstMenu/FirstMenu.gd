extends Control


var next_scene = "res://src/UserInterface/Loby/Loby.tscn"
var setting_scene = "res://src/UserInterface/Settings/Settings.tscn"

func _ready():
	if get_tree().paused == true:
		get_tree().paused = false


func _on_TouchPlay_pressed() -> void:
	$Menu/TouchPlay.position.y += 2

func _on_TouchQuit_pressed() -> void:
	$Menu/TouchQuit.position.y += 2
	
func _on_TouchSettings_pressed() -> void:
	$Menu/TouchSettings.position.y += 2

func _on_TouchPlay_released() -> void:
	$AudioClick.play()
	$Menu/TouchPlay.position.y -= 2
	$AnimationMenu.play("click_btn")
	
	yield($AnimationMenu, "animation_finished")
	# warning-ignore:return_value_discarded
	get_tree().change_scene(next_scene)


func _on_TouchSettings_released() -> void:
	$AudioClick.play()
	$Menu/TouchSettings.position.y -= 2
	$AnimationMenu.play("click_btn")
	
	yield($AnimationMenu, "animation_finished")
# warning-ignore:return_value_discarded
	get_tree().change_scene(setting_scene)


func _on_TouchQuit_released() -> void:
	$Menu/TouchQuit.position.y -= 2
	$AudioClick.play()
	$AnimationMenu.play("click_btn")
	
	yield($AnimationMenu, "animation_finished")
	get_tree().quit()
