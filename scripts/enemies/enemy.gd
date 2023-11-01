extends CharacterBody2D
class_name Enemy

signal wake_up

func awake():
	emit_signal("wake_up")

func follow_player() -> void:
	pass
