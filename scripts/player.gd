extends CharacterBody2D

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
	global_position.x = clampf(global_position.x, 0, screen_size.x)
	global_position.y = clampf(global_position.y, 0, screen_size.y)
	
