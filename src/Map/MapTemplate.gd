extends Node2D

onready var label_fps = $LayerFPS/FPSLabel
onready var player_scene = $Player
onready var data = Database.loadData()

var fps = null


func _ready() -> void:
	checkFPS_OnOff()
	
	if Database.music == true:
		$AudioBacksound.play()
	
# warning-ignore:return_value_discarded
	Autoload.connect("next", self, "openDoor")
	
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		var pause = get_node("PauseLayer/PauseOverlay")
		pause.show()
		
	if event.is_action_pressed("reset"):
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()


# warning-ignore:unused_argument
func _process(delta: float) -> void:
	if fps == true :
		label_fps.text = str(Engine.get_frames_per_second()) + " FPS"

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



func checkFPS_OnOff():
	var fps_setting = data["game_settings"]["setting_fps"]
	if fps_setting["FPSlabel"] == true:
		fps = true
	else : fps = false
	
	
#func checkMusic_OnOff():
#	var music_sett = data["game_settings"]["sound_setting"]
#	if music_sett["music"]["checked"] == true:
#		return true
#	else : return false
	
