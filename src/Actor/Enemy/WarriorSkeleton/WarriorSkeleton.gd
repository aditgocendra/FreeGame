extends KinematicBody2D

var speed = 100.0
var gravity = ProjectSettings.get("physics/2d/default_gravity")
var velocity = Vector2.ZERO
const FLOOR_NORMAL = Vector2.UP

onready var floor_detector_right = $PlatformDetectRight
onready var floor_detector_left = $PlatformDetectLeft

enum State {
	WALKING,
	DEAD,
	ATTACK
}
var _state


func _ready():
	enemy_walk()
	

func _physics_process(delta):
	
	velocity = calculate_move_velocity(velocity)
	
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	
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


func _on_AreaAttack_body_entered(body):
	if body is Player:
		print(true)
