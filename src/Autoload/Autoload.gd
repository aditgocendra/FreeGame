extends Node


signal next
signal stage

var path_switch setget next_level
var _stage setget set_stage

func next_level(path):
	path_switch = path
	emit_signal("next")

func set_stage(add_stage):
	_stage = add_stage
	emit_signal("stage")
