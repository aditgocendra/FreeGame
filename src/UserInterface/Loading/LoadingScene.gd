extends Control

var rng = RandomNumberGenerator.new()
var stage = null

onready var data = Database.loadData()
onready var texture_loading = $TextureLoading 

func _ready():
	setTextureLoading()

func randomNumber() -> int:
	rng.randomize()
	var random =  rng.randi_range(0,4)
	return random


func setTextureLoading():
	var data_loading = data["loading"].values()
	
	var text_loc =  data_loading[randomNumber()].texture
	
	texture_loading.texture = load(text_loc)
	
	
func _on_TimerLoading_timeout():
# warning-ignore:return_value_discarded
	get_tree().change_scene(Autoload._stage)
	
