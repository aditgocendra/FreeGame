extends Area2D

func _ready():
	$AnimatedSprite.play("Start")


func _on_Coin_body_entered(body):
	if body is Player:
		Autoload._score += 10
		queue_free()
