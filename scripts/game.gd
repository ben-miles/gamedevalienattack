extends Node2D

func _on_enemy_despawner_area_entered(area):
	area.die()
