extends RigidBody2D
class_name Bullet

onready var sprite_bullet = $BulletSprite

func _ready() -> void:
	sprite_bullet.play("Destroy")
	

func _on_body_entered(body: Node) -> void:
	if body is MagicianEnemy:
		body.enemy_destroy()
		queue_free()
	if body is WarriorEnemy:
		body.enemy_destroy()
		queue_free()


func _on_BulletSprite_animation_finished() -> void:
	queue_free()


