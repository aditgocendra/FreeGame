extends TouchScreenButton
class_name TouchCustom

var previous_mouse_position = Vector2()
var is_dragging = false

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if (is_dragging):
		var pos = get_viewport().get_mouse_position()
		set_position(pos)
		get_parent().get_parent().setCustPos(position)


func changeTrans(new_trans, node) -> void:
	var new_color =  Color(1,1,1, new_trans)
	node.set_modulate(new_color)
