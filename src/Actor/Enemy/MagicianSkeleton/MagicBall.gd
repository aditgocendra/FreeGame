extends RigidBody2D

onready var sprite_magic = $SpriteMagic

func _ready() -> void:
	sprite_magic.play("Destroy")


func _on_SpriteMagic_animation_finished() -> void:
	queue_free()


func _on_MagicBall_body_entered(body: Node) -> void:
	if body is Player:
		body.die()
		queue_free()
	elif body.name == "Bullet":
		queue_free()
		body.queue_free()
