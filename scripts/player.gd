extends CharacterBody2D

var laser_scene = preload("res://scenes/laser.tscn")

func shoot():
	var laser_instance = laser_scene.instantiate()
	add_child(laser_instance)
	laser_instance.global_position.x += 80

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
