## Switches current weapon and keeps track of ammo
extends Node2D
class_name WeaponManager

#Ammo
@export var shells := 8
@export var light_rounds: int
@export var rockets: int

var current_weapon = 0

func _process(_delta):
	if Input.is_action_pressed("shoot"):
		var children = get_children()
		children[current_weapon].shoot()
