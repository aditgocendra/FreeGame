extends RigidBody2D

onready var sprite_bullet = $BulletSprite

func _ready() -> void:
	sprite_bullet.play("Destroy")
	

func _on_body_entered(body: Node) -> void:
	if body is MagicianEnemy:
		body.enemy_destroy()
		queue_free()


func _on_BulletSprite_animation_finished() -> void:
	
	queue_free()
