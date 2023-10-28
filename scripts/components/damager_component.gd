extends Area2D
class_name DamagerComponent

var damage := 20
signal collided_with_hitbox
signal collided_with_object

func _on_area_entered(area):
	if area is HurtBox:
		emit_signal("collided_with_hitbox")


func _on_body_entered(_body):
	emit_signal("collided_with_object")

