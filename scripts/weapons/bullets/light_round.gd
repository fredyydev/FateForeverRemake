extends Node2D
class_name LightRound


var speed := 2000.0
@export var damage := 12.0

func _ready():
	$DamagerComponent.damage = damage

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_self_destruct_timer_timeout():
	queue_free()


func _on_damager_component_collided_with_hitbox():
	queue_free()


func _on_damager_component_collided_with_object():
	queue_free()

