extends Area2D

onready var explosion_coll = $ExplosionArea/CollisionShape2D
onready var explosion_anim = $ExplosionArea/AnimationPlayer

func _ready() -> void:
	explosion_coll.disabled = true


func _on_Barel_body_entered(body: Node) -> void:
	if body is Bullet:
		body.queue_free()
		explosion_anim.play("play_explosion")
		
		var screen_shake = body.get_parent().get_parent().get_parent().get_node("Camera2D").get_node("ScreenShake")
		screen_shake.start()
		yield(explosion_anim, "animation_finished")
		
		queue_free()
