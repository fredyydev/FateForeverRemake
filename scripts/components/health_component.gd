extends Node
class_name HealthComponent

@export var max_health := 100.0
@onready var current_health := max_health

signal health_changed(current_value)
signal health_reached_zero
#md is a dictionary so you can pass any value you want
signal damaged(amount)
signal healed

func _process(_delta):
	#Makes sure health never goes over max.
	if current_health > max_health:
		current_health = max_health
		
	if current_health <= 0:
		emit_signal("health_reached_zero")

#md is a dictionary so you can pass any value you want
func take_damage(amount: float) -> void:
	current_health -= amount
	if current_health <= 0:
		emit_signal("health_reached_zero")
	emit_signal("health_changed", current_health)
	emit_signal("damaged", amount)

func heal(amount: float) -> void:
	current_health += amount
	emit_signal("health_changed", current_health)
	emit_signal("healed")
