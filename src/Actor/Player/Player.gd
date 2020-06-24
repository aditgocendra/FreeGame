class_name Player
extends KinematicBody2D

export var speed = Vector2(220.0, 700.0)

const FLOOR_DETECT_DISTANCE = 20.0
var velocity = Vector2.ZERO
var gravity = 1000.0
var FLOOR_NORMAL = Vector2.UP

onready var direction_ui = get_node("Control")
onready var data = Database.loadData()
onready var Gun = $AnimatedPlayer/Gun

var control : bool

func _ready() -> void:
	control = checkControler()
	if control == false:
		remove_child(direction_ui)
	$AnimationPlayer.play("Spawn")
	$SpawnTimer.start()


func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if control == false :
		direction = get_direction()
	else : #Mobile UI
		direction = direction_ui.calculate_direction_UI()
		if direction.y == -1 and is_on_floor():
			direction = direction_ui.calculate_direction_UI()
		else: direction = Vector2(direction.x, 1)
	
	if $SpawnTimer.is_stopped():
		$AnimationPlayer.stop()
		
	playAudio()
	
	var is_jump_interrupted = Input.is_action_just_released("Jump") and velocity.y < 0.0
	velocity = calculateMovement(velocity, direction, delta, is_jump_interrupted)
	
	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	var is_on_platform = $PlatformDetector.is_colliding()
	velocity = move_and_slide_with_snap(
		velocity, snap_vector, FLOOR_NORMAL, not is_on_platform, 4, 0.9, false
	)
	
	if direction.x != 0:
		$AnimatedPlayer.scale.x = 1 if direction.x > 0 else -1
	
	var is_shooting = false
	
	if Input.is_action_just_pressed("shoot") and $AnimatedPlayer.animation != "Dead":
		is_shooting =  Gun.shoot($AnimatedPlayer.scale.x)
		$AnimatedPlayer/Gun/AudioShoot.play()
	
	if $AnimatedPlayer.animation == "Dead" and $TimerAnimation.is_stopped():
# warning-ignore:return_value_discarded
			get_tree().reload_current_scene()
	
	var animation = setAnimation(is_shooting)
	
	if $AnimatedPlayer.animation != animation and $TimerAnimation.is_stopped():
		if is_shooting:
			$TimerAnimation.start()
		$AnimatedPlayer.play(animation)
	
	

func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("move_up") and is_on_floor() else 1.0
	)
	
func calculateMovement(linear_velocity, direction, delta_time, is_jump_interrupted) -> Vector2:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * delta_time
	if direction.y == -1.0:
		new_velocity.y += speed.y * direction.y
	if is_jump_interrupted:
		velocity.y = 0.0
	return new_velocity
	
func setAnimation(is_shoot):
	var new_animation = ""
	
	if is_on_floor():
		new_animation = "Run" if abs(velocity.x) > 0.1 else "Idle"
	else:
		if velocity.y < 0 : new_animation = "Jump"
		 
	if is_shoot:
		if velocity.y != 0 and velocity.x != 0:
			new_animation = "JumpShoot"
		elif velocity.x != 0:   
			new_animation = "RunShoot"
		elif velocity.y != 0:
			new_animation = "JumpShoot" 
		else : new_animation = "Shoot"
	
	
	return new_animation


func die():
	$TimerAnimation.start()
	$AnimatedPlayer.play("Dead")
	

func playAudio():
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		$AudioJump.play()


func checkControler():
	
	var data_controller = data["game_settings"]["game_controller"]
	if data_controller["control"] == false:
		return false
	else: return true
