extends Node2D
class_name ShotgunPellet


var speed := 1000.0
@export var max_speed := 1800.0
@export var min_speed := 1500.0
@export var damage := 10.0

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	speed = rng.randf_range(min_speed, max_speed)
	$DamagerComponent.damage = damage

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_self_destruct_timer_timeout():
	queue_free()


func _on_damager_component_collided_with_hitbox():
	queue_free()


func _on_damager_component_collided_with_object():
	queue_free()
