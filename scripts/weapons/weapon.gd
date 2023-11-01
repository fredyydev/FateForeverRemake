##Base class for all weapons
extends Node2D
class_name Weapon

#Virtual function to be overriden
func shoot():
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		if position.distance_to(enemy.global_position) < 800:
			enemy.awake()
