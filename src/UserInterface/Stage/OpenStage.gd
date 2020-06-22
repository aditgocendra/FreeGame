extends TextureRect

var stage = null

func _ready() -> void:
	Autoload.connect("stage", self, "update_stage")


func _on_OpenStage_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		get_tree().change_scene(stage)


func update_stage() -> void:
	stage = Autoload._stage
