# meta-name: State
# meta-description: Default state structure for state machines.
# meta-default: false
extends State


func on_enter(_metadata: Dictionary) -> void:
	pass


func on_exit() -> void:
	pass


func on_update(_delta: float) -> void:
	pass


func on_physics_update(_delta: float) -> void:
	pass


func on_input(_event) -> void:
	pass
