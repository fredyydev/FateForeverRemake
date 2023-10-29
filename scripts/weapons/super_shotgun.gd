extends Node2D


@onready var fire_rate: Timer = $FireRate
signal fired

@export var bullet_scene: PackedScene
#The amount of bullets the shotgun shoots at once
@export var amount_of_pellets := 10
@export var max_pellet_angle := 5.0

func shoot():
	if not fire_rate.is_stopped():
		return

	fire_rate.start()
	emit_signal("fired")

	# This loop will spread out bullets within the max_pellet_angle range
	for a in amount_of_pellets:
		var desired_angle = (-max_pellet_angle) + (a+1) * (max_pellet_angle - (-max_pellet_angle)) / (amount_of_pellets + 1)
		var new_bullet = bullet_scene.instantiate() as Node2D
		new_bullet.position = $BulletSpawnPoint.global_position
		new_bullet.rotation_degrees = $BulletSpawnPoint.global_rotation_degrees + desired_angle
		get_tree().current_scene.add_child(new_bullet)
