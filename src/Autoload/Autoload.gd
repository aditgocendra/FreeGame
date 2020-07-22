extends Node


signal next
signal stage
signal score

var path_switch setget next_level
var _stage setget set_stage
var _score : int setget set_score

func next_level(path):
	path_switch = path
	emit_signal("next")

func set_stage(add_stage):
	_stage = add_stage
	emit_signal("stage")

func set_score(new_score):
	_score = new_score
	emit_signal("score")
