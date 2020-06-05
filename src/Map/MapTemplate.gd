extends Node2D

onready var label_fps = $LayerFPS/FPSLabel
onready var player_scene = $Player
func _ready() -> void:
# warning-ignore:return_value_discarded
	Autoload.connect("next", self, "openDoor")
	

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	label_fps.text = str(Engine.get_frames_per_second())
	if Input.is_action_pressed("reset"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	
	if player_scene.position.y > 1000:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
		
	


func openDoor() -> void:
	var switch = $SwitchGroup
	var switch_count =  switch.get_child_count()
	var door = []
	
	for i in range(switch_count):
		var switch_node =  switch.get_child(i).get_child(0).texture.resource_path
		if switch_node != Autoload.path_switch:
			door.append(false)
		else : door.append(true)
		
	if door.has(false) != true:
		$Portal/Sprite.texture = load("res://assets/tileset/png/Objects/DoorOpen.png")
