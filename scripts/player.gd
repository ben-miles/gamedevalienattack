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
	
	if global_position.x < 0:
		global_position.x = 0
	if global_position.x > 1280:
		global_position.x = 1280
	if global_position.y < 0:
		global_position.y = 0
	if global_position.y > 720:
		global_position.y = 720
		
	print(global_position)
