extends Node


var db_path = "res://src/Autoload/database.json"
var _file

var json_data


var default_data = {
  "game_settings":{
	"game_controller":{
	  "control_ui":true
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
  }
}


func _ready() -> void:
	loadData()


func loadData():
	_file = File.new()
		
	if not _file.file_exists(db_path):
		save_data(default_data)
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
