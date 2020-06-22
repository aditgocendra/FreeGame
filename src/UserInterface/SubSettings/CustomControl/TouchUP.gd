extends TouchCustom

func _on_TouchUP_pressed() -> void:
	get_parent().get_parent().setCustTrans(modulate, self)
	is_dragging = true
	

func _on_TouchUP_released() -> void:
	is_dragging = false
