extends Area2D
class_name HurtBox
##Detects damage and applies it to a health component

@export var health_component: HealthComponent

func _on_body_entered(body):
	health_component.take_damage(body.damage)

