extends Area2D

var click = false

var off_path_switch = "res://assets/tileset/png/Objects/Switch (2).png"
var on_path_switch = "res://assets/tileset/png/Objects/Switch (1).png"

func _on_Switch_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("mouse_click_left"):
		var path_now  = $Sprite.texture.resource_path
		if path_now == off_path_switch:
			$Sprite.texture = load(on_path_switch)
			Autoload.path_switch = on_path_switch
