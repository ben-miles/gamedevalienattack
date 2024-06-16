extends Node2D

var lives = 3
var score = 0
var game_over_screen = preload("res://scenes/game_over_screen.tscn")
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_die_sound = $PlayerDieSound

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_enemy_despawner_area_entered(area):
	area.queue_free()

func _on_player_took_damage():
	player_die_sound.play()
	lives -= 1
	hud.set_lives(lives)
	if(lives == 0):		
		player.die()
		await get_tree().create_timer(1.5).timeout
		var game_over_screen_instance = game_over_screen.instantiate()
		game_over_screen_instance.set_score(score)
		$UI.add_child(game_over_screen_instance)

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play()
