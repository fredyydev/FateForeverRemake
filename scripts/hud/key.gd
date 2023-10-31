extends TextureRect

var initial_modulate: Color

@export var brightness_when_disabled := 0.3
@export var alpha_when_disabled := 0.5
@export var saturation_when_disabled := 0.5

var key_obtained: bool:
	get:
		return key_obtained
	set(value):
		if value:
			modulate = initial_modulate
		else:
			modulate.v = brightness_when_disabled
			modulate.a = alpha_when_disabled
			modulate.s = saturation_when_disabled
			
		key_obtained = value

func _ready():
	initial_modulate = modulate
	key_obtained = false
