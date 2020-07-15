extends Area2D

var click = false

onready var off_path_switch = "res://assets/tileset/png/Objects/Switch (2).png"
onready var on_path_switch = "res://assets/tileset/png/Objects/Switch (1).png"

# warning-ignore:unused_argument
# warning-ignore:unused_argument
func _on_Switch_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventScreenTouch:
		if event.is_pressed():
			var path_now  = $Sprite.texture.resource_path
			if path_now == off_path_switch:
				$Sprite.texture = load(on_path_switch)
				Autoload.path_switch = on_path_switch
