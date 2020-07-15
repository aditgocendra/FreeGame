class_name Player
extends KinematicBody2D

export var speed = Vector2(220.0, 700.0)

const FLOOR_DETECT_DISTANCE = 20.0

var velocity = Vector2.ZERO
var gravity = 1000.0
var FLOOR_NORMAL = Vector2.UP

var control : bool
var sfx = null

onready var control_ui = get_node("Control")
onready var data = Database.loadData()
onready var Gun = $AnimatedPlayer/Gun
onready var health_bar = $PlayerBar/PlayerBar/PlayerHead/HealthBar
onready var platform = $PlatformDetector
onready var poison = $PoisonDetector



func _ready() -> void:
	control = checkControler()
#	sfx = checkSfx_OnOff()
	if control == false:
		remove_child(control_ui)
	$AnimationPlayer.play("Spawn")
	$SpawnTimer.start()


func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if control == false :
		direction = get_direction()
	else : #Mobile UI
		direction = control_ui.calculate_direction_UI()
		if direction.y == -1 and is_on_floor():
			direction = control_ui.calculate_direction_UI()
		else: direction = Vector2(direction.x, 1)
	
	if $SpawnTimer.is_stopped():
		$AnimationPlayer.stop()
	
	if Database.sfx == true:
		playAudio()
	
	
	var is_jump_interrupted = Input.is_action_just_released("Jump") and velocity.y < 0.0
	velocity = calculateMovement(velocity, direction, delta, is_jump_interrupted)
	var is_on_platform = platform.is_colliding()
	var snap_vector = Vector2.DOWN * FLOOR_DETECT_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	
	velocity = move_and_slide_with_snap(
		velocity, snap_vector, FLOOR_NORMAL, not is_on_platform, 4, 0.9, false
	)
	
	if direction.x != 0:
		$AnimatedPlayer.scale.x = 1 if direction.x > 0 else -1
	
	var is_shooting = false
	
	if Input.is_action_just_pressed("shoot") or control_ui.attack_ui  and $AnimatedPlayer.animation != "Dead":
		control_ui.attack_ui = false
		is_shooting =  Gun.shoot($AnimatedPlayer.scale.x)
		
		
	if $AnimatedPlayer.animation == "Dead" and $TimerAnimation.is_stopped():
		get_tree().paused = true
		$GameOver/GameOver.show()
		
	if poison.is_colliding():
		get_tree().paused = true
		$GameOver/GameOver.show()

		
	var animation = setAnimation(is_shooting)
	
	if $AnimatedPlayer.animation != animation and $TimerAnimation.is_stopped():
		if is_shooting:
			$TimerAnimation.start()
		$AnimatedPlayer.play(animation)
	
	

func get_direction() -> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("move_up") and is_on_floor() else 0.0
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
	if health_bar.value <= 0:
		$TimerAnimation.start()
		$AnimatedPlayer.play("Dead")
	else: 
		health_bar.value -= 25
		if health_bar.value <= 0:
			$TimerAnimation.start()
			$AnimatedPlayer.play("Dead")
		else :
			$AnimationPlayer.play("HitAnim")
			$SpawnTimer.start()
		
	

func playAudio():
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		$AudioJump.play()
	if Input.is_action_just_pressed("shoot") or control_ui.attack_ui  and $AnimatedPlayer.animation != "Dead":
		$AnimatedPlayer/Gun/AudioShoot.play()


func checkControler():
	var data_controller = data["game_settings"]["game_controller"]
	if data_controller["control"] == false:
		return false
	else: return true



