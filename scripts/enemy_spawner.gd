extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

@onready var spawn_positions = $SpawnPositions

func _on_timer_timeout():
	enemy_spawn()

func enemy_spawn():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spwan_position = spawn_positions_array.pick_random()
	
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = random_spwan_position.global_position
	add_child(enemy_instance)
