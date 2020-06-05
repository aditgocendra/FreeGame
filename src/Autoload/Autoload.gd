extends Node


signal next

var path_switch setget next_level


func next_level(path):
	path_switch = path
	emit_signal("next")
	
