extends Area2D
class_name HurtBox
##Detects damage and applies it to a health component

@export var health_component: HealthComponent

func _on_area_entered(area):
	if area is DamagerComponent:
		health_component.take_damage(area.damage)
		if owner is Enemy:
			owner.emit_signal("wake_up")

