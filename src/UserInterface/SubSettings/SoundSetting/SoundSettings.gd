extends Control

var data = Database.loadData()

onready var check_fx = $VBoxContainer/ContainerSoundFX/CheckBox
onready var check_music = $VBoxContainer/ContainerSoundMusic/CheckBox



func _ready() -> void:
	setSoundSett()
	
	
func setSoundSett():
	var sfx_data = data["game_settings"]["sound_setting"]["sfx"]
	var music_data = data["game_settings"]["sound_setting"]["music"]
	sfxSet(sfx_data)
	musicSet(music_data)
	

func sfxSet(sfx_data) -> void:
	if sfx_data["checked"] == true:
		check_fx.pressed = true
	else : check_fx.pressed = false


func musicSet(music_data) -> void:
	if music_data["checked"] == true:
		check_music.pressed = true
	else : check_music.pressed = false
