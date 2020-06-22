extends Area2D

func _on_Saw_body_entered(body: Node) -> void:
	if body is Player:
# warning-ignore:return_value_discarded
		body.die()
