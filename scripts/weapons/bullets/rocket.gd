extends Node2D
class_name Rocket


@export var speed := 2000.0
@export var damage := 50.0

func _ready():
	$DamagerComponent.damage = damage

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_self_destruct_timer_timeout():
	queue_free()


func _on_damager_component_collided_with_hitbox():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("explode")


func _on_damager_component_collided_with_object():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("explode")

