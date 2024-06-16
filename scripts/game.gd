extends Node2D

var lives = 3

@onready var player = $Player

func _on_enemy_despawner_area_entered(area):
	area.die()
	
func _on_player_took_damage():
	lives -= 1
	if(lives == 0):
		print('game over')
		player.die()
	else:
		print(lives)
