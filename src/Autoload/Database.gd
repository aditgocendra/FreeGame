extends Node


var db_path = "res://src/Autoload/database.json"
var _file

var json_data

# set sound
var music
var sfx 
#----------


var default_data = {
  "game_settings":{
	"game_controller":{
	  "control":true
	},
	"control_ui":{
	  "touch_left":{
		"modulate":{
		  "r":1, "g":1, "b":1, "a":1
		},"position":{
		  "x":38.47,"y":370.404
		}
	  },
	  "touch_right":{
		"modulate":{
		  "r":1, "g":1, "b":1, "a":1
		},"position":{
		  "x":122.47,"y":370.404
		}
	  },
	  "touch_up":{
		"modulate":{
		  "r":1, "g":1, "b":1, "a":1
		},"position":{
		  "x":80.47,"y":306.404
		}
	  },
	  "touch_attack":{
		"modulate":{
		  "r":1, "g":1, "b":1, "a":1
		},"position":{
		  "x":699.572,"y":335.331
		}
	  },
	  "touch_setting":{
		"modulate":{
		  "r":1, "g":1, "b":1, "a":1
		},"position":{
		  "x":793.194,"y":14.954
		}
	  },
	},
	"setting_fps":{
	  "FPSlabel": true
	},
	"sound_setting":{
	  "sfx": {
		"checked": true,
		"vol": 0
	  },
	  "music": {
		"checked": true,
		"vol": 0
	  }
	}
  },  
  "stage": {
	"0": {
	  "stage_clear": true,
	  "stage_name": "Map1",
	  "stage_scene": "res://src/Map/Map1.tscn"
	},
	"1": {
	  "stage_clear": false,
	  "stage_name": "Map1",
	  "stage_scene": "res://src/Map/Map2.tscn"
	}
  }
}


func _ready() -> void:
	var _data =  loadData()
	sfx = checkSfx_OnOff(_data)
	music = checkMusic_OnOff(_data)

func loadData():
	_file = File.new()
		
	if not _file.file_exists(db_path):
		save_data(default_data)
		return default_data
	else:
		_file.open(db_path, File.READ)
		
		json_data = parse_json(_file.get_as_text())
		
		if json_data.size() > 0:
			return json_data


func save_data(new_data):
	_file = File.new()
	
	_file.open(db_path, File.WRITE)
	_file.store_line(to_json(new_data))
	_file.close()


func checkSfx_OnOff(data):
	var sfx_sett = data["game_settings"]["sound_setting"]
	if sfx_sett["sfx"]["checked"] == true:
		 return true
	else : return false


func checkMusic_OnOff(data):
	var music_sett = data["game_settings"]["sound_setting"]
	if music_sett["music"]["checked"] == true:
		return true
	else : return false
