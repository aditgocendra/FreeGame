extends Control

onready var data = Database.loadData()
onready var index = 1
onready var texture_tutorial = $TextureTutorial
onready var data_tutorial = null

func _ready():
	data_tutorial = data["tutorial"].values()

func _on_TouchChangeButton_pressed():
	if index < data_tutorial.size():
		texture_tutorial.texture = load(data_tutorial[index].path_texture)
		index += 1
# warning-ignore:return_value_discarded
	else : get_tree().change_scene("res://src/UserInterface/Loby/Loby.tscn")
	




