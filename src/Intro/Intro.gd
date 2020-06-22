extends Control

var next_scene = "res://src/UserInterface/FirstMenu/FirstMenu.tscn"


func _on_AnimationIntro_animation_finished(anim_name: String) -> void:
	if anim_name == "play_intro":
# warning-ignore:return_value_discarded
		get_tree().change_scene(next_scene)
