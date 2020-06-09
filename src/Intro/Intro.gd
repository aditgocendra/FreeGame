extends Control

var next_scene = "res://src/UserInterface/FirstMenu/FirstMenu.tscn"

func _on_AnimationIntro_animation_finished(anim_name: String) -> void:
	get_tree().change_scene(next_scene)
