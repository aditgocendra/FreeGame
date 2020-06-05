extends Position2D

const bullet_velocity = 600.0
onready var Bullet = preload("res://src/Object/Bullet/Bullet.tscn")
onready var timer = $Cooldown


func shoot(direction = 1):
	if not timer.is_stopped():
		return false
	var bullet = Bullet.instance()
	if direction == -1:
		bullet.scale.x = 1 if direction > 0 else -1
	bullet.global_position = global_position
	bullet.linear_velocity = Vector2(direction * bullet_velocity, 0)
	
	bullet.set_as_toplevel(true)
	add_child(bullet)
	return true
