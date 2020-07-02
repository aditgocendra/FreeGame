extends TextureRect

onready var loading_scene = "res://src/UserInterface/Loading/LoadingScene.tscn"

func _on_OpenStage_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
# warning-ignore:return_value_discarded
		get_tree().change_scene(loading_scene)



