extends Control

onready var stage_lock = preload("res://src/UserInterface/Stage/LockedStage.tscn").instance()
onready var stage_open = preload("res://src/UserInterface/Stage/OpenStage.tscn").instance()
onready var stage_container = $StageBG/StageContainer
onready var data = Database.loadData()

var max_stage = 30

func _ready() -> void:
	if get_tree().paused == true:
		get_tree().paused = false
	addStage()
	

func addStage() -> void:
	var stage_data = data["stage"].values()
	
	for i in range(max_stage):
		var lock_stage =  stage_lock.duplicate()
		var open_stage =  stage_open.duplicate()
		
		if i < stage_data.size():
			if stage_data[i].stage_clear:
				open_stage.get_node("LabelStage").text = str(i+1)
				stage_container.add_child(open_stage)
				Autoload._stage = stage_data[i].stage_scene
		else: stage_container.add_child(lock_stage)



func _on_TouchScreenButton_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/UserInterface/FirstMenu/FirstMenu.tscn")


func _on_TouchTutorialButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/UserInterface/Tutorial/Tutorial.tscn")
