## Switches current weapon and keeps track of ammo
extends Node2D
class_name WeaponManager

#Ammo
@export var ammo := {
	"shells" : 8,
	"light_rounds" : 0,
	"rockets" : 0
}

#UI
@export var ammo_label: Label

var current_weapon = 0
var current_weapon_node: Node2D

func _ready():
	switch_weapon(current_weapon)

func _input(event):
	#Switch weapon via numkeys
	if event is InputEventKey:
		var desired_weapon = event.as_text() as int
		if desired_weapon != 0: 
			switch_weapon(desired_weapon - 1)

func _process(_delta):
	if ammo[current_weapon_node.ammo_type] < 0:
		ammo[current_weapon_node.ammo_type] = 0
	
	ammo_label.text = str(ammo[current_weapon_node.ammo_type])
	
	if Input.is_action_just_pressed("next_weapon"):
		switch_to_next()
	if Input.is_action_just_pressed("previous_weapon"):
		switch_to_previous()
	
	if Input.is_action_pressed("shoot"):
		if ammo[current_weapon_node.ammo_type] > 0:
			var children = get_children()
			#shoot and get bullets that were used to shoot
			var bullets_used = children[current_weapon].shoot()
			ammo[current_weapon_node.ammo_type] -= bullets_used

func switch_weapon(id: int) -> void:
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
	
	current_weapon_node = get_child(current_weapon) 


func switch_to_next() -> void:
	current_weapon += 1
	if current_weapon >= get_child_count():
		current_weapon = 0
	switch_weapon(current_weapon)
	
func switch_to_previous() -> void:
	current_weapon -= 1
	if current_weapon < 0:
		current_weapon = get_child_count() - 1
	switch_weapon(current_weapon)
