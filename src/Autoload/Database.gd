extends Node


#var db_path = "res://src/Autoload/database.json"
var db_path = "user://database.json"

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
	 "control_ui": {
	  "touch_attack": {
		"modulate": {
		  "a": 1,
		  "b": 1,
		  "g": 1,
		  "r": 1
		},
		"position": {
		  "x": 699.572021,
		  "y": 335.330994
		},
		"scale":{
		  "x":1,
		  "y":1
		}
	  },
	  "touch_left": {
		"modulate": {
		  "a": 1,
		  "b": 1,
		  "g": 1,
		  "r": 1
		},
		"position": {
		  "x": 38.470001,
		  "y": 370.403992
		},
		"scale":{
		  "x":1,
		  "y":1
		}
	  },
	  "touch_right": {
		"modulate": {
		  "a": 1,
		  "b": 1,
		  "g": 1,
		  "r": 1
		},
		"position": {
		  "x": 122.470001,
		  "y": 370.403992
		},
		"scale":{
		  "x":1,
		  "y":1
		}
	  },
	  "touch_setting": {
		"modulate": {
		  "a": 1,
		  "b": 1,
		  "g": 1,
		  "r": 1
		},
		"position": {
		  "x": 793.19397,
		  "y": 14.954
		},
		"scale":{
		  "x":1,
		  "y":1
		}
	  },
	  "touch_up": {
		"modulate": {
		  "a": 1,
		  "b": 1,
		  "g": 1,
		  "r": 1
		},
		"position": {
		  "x": 80.470001,
		  "y": 306.403992
		},
		"scale":{
		  "x":1,
		  "y":1
		}
	  }
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
  "loading": {
	"001": {
	  "texture": "res://assets/loading/banner-1.png"
	},
	"002": {
	  "texture": "res://assets/loading/banner-2.png"
	},
	"003": {
	  "texture": "res://assets/loading/banner-3.png"
	},
	"004": {
	  "texture": "res://assets/loading/banner-4.png"
	},
	"005": {
	  "texture": "res://assets/loading/banner-5.png"
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
	},
	"2": {
	  "stage_clear": false,
	  "stage_name": "Map2",
	  "stage_scene": "res://src/Map/Map3.tscn"
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
