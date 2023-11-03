extends Weapon

@export var bullet_scene: PackedScene
@onready var bullet_spawn_point := $BulletSpawnPoint as Node2D

func shoot():
	super()
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bullet_spawn_point.global_position
	bullet.global_rotation = bullet_spawn_point.global_rotation
	get_tree().current_scene.add_child(bullet)
