extends Weapon
class_name RocketLauncher


@export var bullet_scene: PackedScene
@export var fire_rate: Timer

var ammo_type = "rockets"

signal fired

var rng = RandomNumberGenerator.new()

func shoot() -> int:
	if not fire_rate.is_stopped():
		return 0
	
	emit_signal("fired")
	fire_rate.start()
	
	rng.randomize()
	
	var new_bullet = bullet_scene.instantiate() as Node2D
	new_bullet.position = $BulletSpawnPoint.global_position
	new_bullet.rotation_degrees = $BulletSpawnPoint.global_rotation_degrees 
	get_tree().current_scene.add_child(new_bullet)
	return 1
