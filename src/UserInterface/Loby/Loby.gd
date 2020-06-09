extends Control


onready var stage_lock = preload("res://src/UserInterface/Stage/LockedStage.tscn").instance()
onready var stage_open = preload("res://src/UserInterface/Stage/OpenStage.tscn").instance()
onready var stage_container = $StageBG/StageContainer

var max_stage = 29

func _ready() -> void:
	stage_container.add_child(stage_open)
	for i in range(max_stage):
		var new_stage =  stage_lock.duplicate()
		stage_container.add_child(new_stage)
		
