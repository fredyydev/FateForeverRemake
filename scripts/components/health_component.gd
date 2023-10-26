extends Node
class_name HealthComponent

@export var max_health := 100.0
var current_health := max_health

signal health_changed
signal health_reached_zero
signal damaged
signal healed

func _process(delta):
	#Makes sure health never goes over max.
	if current_health > max_health:
		current_health = max_health
		
	if current_health <= 0:
		emit_signal("health_reached_zero")

func take_damage(amount: float) -> void:
	current_health -= amount
	if current_health <= 0:
		emit_signal("health_reached_zero")
	emit_signal("health_changed")
	emit_signal("damaged")

func heal(amount: float) -> void:
	current_health += amount
	emit_signal("health_changed")
	emit_signal("healed")
