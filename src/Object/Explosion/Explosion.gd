extends Area2D



func _on_ExplosionArea_body_entered(body: Node) -> void:
	if body is Player:
		body.die()
	elif body is MagicianEnemy:
		body.enemy_destroy()
