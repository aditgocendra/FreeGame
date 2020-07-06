class_name WarriorEnemy
extends KinematicBody2D

var speed = 100.0
var gravity = ProjectSettings.get("physics/2d/default_gravity")
var velocity = Vector2.ZERO
const FLOOR_NORMAL = Vector2.UP

onready var floor_detector_right = $PlatformDetectRight
onready var floor_detector_left = $PlatformDetectLeft

onready var detect_collision = $AreaDetectPlayer/CollisionShape2D
onready var hit_collision = $AreaHit/CollisionShape2D

enum State {
	WALKING,
	DEAD,
	ATTACK
}
var _state


func _ready():
	enemy_walk()
	

func _physics_process(delta):
	if $AnimatedSprite.animation == "Dead":
		self.set_physics_process(false)
		yield($AnimatedSprite, "animation_finished")
		queue_free()
	
	if $AnimatedSprite.scale.x == 1:
		detect_collision.position.x = -75
		hit_collision.position.x = -101.225
	else: 
		detect_collision.position.x = 75
		hit_collision.position.x = 101.225
	
	velocity = calculate_move_velocity(velocity)
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	
	if _state == State.ATTACK:
		hit_collision.disabled = false
		if $AnimatedSprite.animation == "Attack":
			yield($AnimatedSprite, "animation_finished")
			hit_collision.disabled = true


	$AnimatedSprite.scale.x = -1 if velocity.x > 0 else 1
	var animation = get_new_animation()

	$AnimatedSprite.play(animation)

	

func calculate_move_velocity(linear_velocity):
	var new_velocity = linear_velocity
	if not floor_detector_left.is_colliding():
		new_velocity.x = speed
	elif not floor_detector_right.is_colliding():
		new_velocity.x = -speed

	if is_on_wall():
		new_velocity.x *= -1

	return new_velocity

func get_new_animation():
	var animation_new = ""
	if _state == State.WALKING:
		animation_new = "Walk"
	elif _state == State.ATTACK:
		animation_new = "Attack"
	else : animation_new = "Dead"
	return animation_new

func enemy_walk():
	_state = State.WALKING
	velocity.y += gravity * get_physics_process_delta_time()
	velocity.x = speed

func enemy_attack():
	_state = State.ATTACK
	velocity = Vector2.ZERO

func enemy_destroy():
	_state = State.DEAD
	velocity = Vector2.ZERO

func _on_AreaAttack_body_entered(body):
		if body is Player:
			enemy_attack()
		
		

func _on_AreaAttack_body_exited(body):
		if body is Player:
			enemy_walk()
		


func _on_AreaHit_body_entered(body):
	if body is Player:
		if _state != State.DEAD:
			body.die()
	

