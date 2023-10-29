extends Node2D
class_name MachineGun


@export var bullet_scene: PackedScene
@export var fire_rate: Timer
@export var max_bullet_angle := 10.0
@export var min_bullet_angle := -10.0

signal fired

var rng = RandomNumberGenerator.new()

func shoot():
	if not fire_rate.is_stopped():
		return
	
	emit_signal("fired")
	fire_rate.start()
	
	rng.randomize()
	var desired_angle = rng.randf_range(min_bullet_angle, max_bullet_angle)
	
	var new_bullet = bullet_scene.instantiate() as Node2D
	new_bullet.position = $BulletSpawnPoint.global_position
	new_bullet.rotation_degrees = $BulletSpawnPoint.global_rotation_degrees + desired_angle
	get_tree().current_scene.add_child(new_bullet)
