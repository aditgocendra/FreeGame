extends Area2D

var time_start = 0
var time_now = 0
var str_elapsed

onready var win_stage = preload("res://src/UserInterface/WinStage/WinStage.tscn").instance()

func _ready():
	time_start = OS.get_unix_time()
	set_process(true)

# warning-ignore:unused_argument
func _process(delta):
	time_now = OS.get_unix_time()
	var elapsed = time_now - time_start
	var minutes = elapsed / 60
	var seconds = elapsed % 60
	str_elapsed = "%02d : %02d" % [minutes, seconds]

func _on_Portal_body_entered(body):
	if body is Player:
		var texture = "res://assets/tileset/png/Objects/DoorOpen.png"
		if $Sprite.texture.resource_path == texture:
			get_tree().paused = true
			win_stage.get_node("VBoxContainer/LabelTimes").text = str_elapsed
			win_stage.get_node("VBoxContainer/LabelScore").text = str(Autoload._score)
			$WinLayer.add_child(win_stage)
			newOpenStage()


func newOpenStage():
	var data = Database.loadData()
	var stage_data = data["stage"].values()
	var name_stage = get_parent().name
	var index_stage = 0
	
	for i in range(stage_data.size()):
		if stage_data[i].stage_name == name_stage:
			index_stage = i +1
			break
	
	data["stage"][str(index_stage)].stage_clear = true
	Database.save_data(data)
	
	
	
	

	
	
	
	
	
	
	
	
	
	
