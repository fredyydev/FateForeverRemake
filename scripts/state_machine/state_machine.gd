extends Node
class_name StateMachine

@export var initial_state: Node
@export var initial_state_metadata: Dictionary
@onready var current_state: State = initial_state as State

signal state_transitioned(current_state: State, metadata: Dictionary)

func _ready():
	current_state.on_enter(initial_state_metadata)


func _process(delta):
	current_state.on_update(delta)


func _physics_process(delta):
	current_state.on_physics_update(delta)

func _input(event):
	current_state.on_input(event)

func transition_to(next_state: String, metadata := {}):
	current_state.on_exit()
	current_state = find_child(next_state)
	emit_signal("state_transitioned", current_state, metadata)
	current_state.on_enter(metadata)
