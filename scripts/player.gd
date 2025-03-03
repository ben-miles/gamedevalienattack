extends CharacterBody2D

signal took_damage

var laser_scene = preload("res://scenes/laser.tscn")
@onready var laser_container = $LaserContainer
@onready var laser_sound = $LaserSound

func _physics_process(delta):
	velocity = Vector2(0,0)
	var force = 300
	
	if Input.is_action_pressed("player_move_down"):
		velocity.y = force
	if Input.is_action_pressed("player_move_left"):
		velocity.x = -force
	if Input.is_action_pressed("player_move_right"):
		velocity.x = force
	if Input.is_action_pressed("player_move_up"):
		velocity.y = -force
	
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(delta):
	if Input.is_action_just_pressed("player_shoot"):
		shoot()

func die():
	queue_free()

func shoot():
	var laser_instance = laser_scene.instantiate()
	laser_container.add_child(laser_instance)
	laser_instance.global_position = global_position
	laser_instance.global_position.x += 80
	laser_sound.play()

func take_damage():
	emit_signal("took_damage")
