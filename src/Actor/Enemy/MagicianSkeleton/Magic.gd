extends Position2D

const magic_velocity = 300.0
onready var Magic = preload("res://src/Actor/Enemy/MagicianSkeleton/MagicBall.tscn")
onready var timer = $Cooldown


func magic_shoot(direction = 1):
	if not timer.is_stopped():
		return false
	var magic = Magic.instance()
	
	if direction == -1:
		magic.scale.x = 1 if direction > 0 else -1
	magic.global_position = global_position
	
	if direction == -1:
		direction = 1
	else : direction = -1
	
	magic.linear_velocity = Vector2(direction * magic_velocity, 0)
	
	magic.set_as_toplevel(true)
	
	
	add_child(magic)
	return true
