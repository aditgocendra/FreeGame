extends Area2D

func _on_Saw_body_entered(body: Node) -> void:
	if body.name == "Player":
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
