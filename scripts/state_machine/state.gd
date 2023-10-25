extends Node
class_name State

var state_machine: StateMachine

func _ready():
	state_machine = get_parent() as StateMachine

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
