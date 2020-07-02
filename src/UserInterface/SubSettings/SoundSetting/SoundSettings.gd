extends Control

var data = Database.loadData()

onready var check_fx = $VBoxContainer/ContainerSoundFX/CheckBox
onready var check_music = $VBoxContainer/ContainerSoundMusic/CheckBox
onready var slider_fx = $VBoxContainer/ContainerSoundFX/HSlider
onready var slider_music = $VBoxContainer/ContainerSoundMusic/HSlider


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
	
	slider_fx.value = sfx_data["vol"]
	


func musicSet(music_data) -> void:
	if music_data["checked"] == true:
		check_music.pressed = true
	else : check_music.pressed = false

	slider_music.value = music_data["vol"]



func _on_BtnApply_gui_input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			update_sound()



func update_sound() -> void:
	var new_data_sound = null
	new_data_sound = {
		music = {
			checked = check_music.pressed,
			vol = slider_music.value
		},
		sfx = {
			checked = check_fx.pressed,
			vol = slider_fx.value
		}
	}
	
	data["game_settings"]["sound_setting"] = new_data_sound
	
	Database.save_data(data)








