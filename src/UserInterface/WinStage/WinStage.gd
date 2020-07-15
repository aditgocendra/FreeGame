extends Control

var next_scene = "res://src/UserInterface/Loby/Loby.tscn"

func _ready():
	$AnimationPlayer.play("Win")


func _on_Loby_gui_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			get_tree().paused = false
# warning-ignore:return_value_discarded
			get_tree().change_scene(next_scene)
			
