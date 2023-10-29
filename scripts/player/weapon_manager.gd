## Switches current weapon and keeps track of ammo
extends Node2D
class_name WeaponManager

#Ammo
@export var shells := 8
@export var light_rounds: int
@export var rockets: int

var current_weapon = 0

func _ready():
	switch_weapon_to(current_weapon)

func _input(event):
	#Switch weapon via numkeys
	if event is InputEventKey:
		var desired_weapon = event.as_text() as int
		if desired_weapon != 0: 
			switch_weapon_to(desired_weapon - 1)

func _process(_delta):
	if Input.is_action_just_pressed("next_weapon"):
		switch_to_next()
	if Input.is_action_just_pressed("previous_weapon"):
		switch_to_previous()
	
	if Input.is_action_pressed("shoot"):
		var children = get_children()
		children[current_weapon].shoot()

func switch_weapon_to(id: int) -> void:
	if id > get_child_count() - 1:
		return
	current_weapon = id
	for i in get_child_count():
		var child = get_child(i) as Node2D
		if i == current_weapon:
			child.set_process(true)
			child.set_physics_process(true)
			child.visible = true
		else:
			child.set_process(false)
			child.set_physics_process(false)
			child.visible = false


func switch_to_next() -> void:
	current_weapon += 1
	if current_weapon >= get_child_count():
		current_weapon = 0
	switch_weapon_to(current_weapon)
	
func switch_to_previous() -> void:
	current_weapon -= 1
	if current_weapon < 0:
		current_weapon = get_child_count() - 1
	switch_weapon_to(current_weapon)
	
