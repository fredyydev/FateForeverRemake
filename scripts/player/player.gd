extends CharacterBody2D
class_name Player

##Keeps track of dash cooldown.
var can_dash := true

#Inventory
var has_blue_key: bool
var has_red_key: bool
var has_yellow_key: bool

#UI 
@export var lifebar: TextureProgressBar
@export var lifebar_label: Label

func _ready():
	lifebar_label.text = str($HealthComponent.current_health) 
	lifebar.max_value = $HealthComponent.max_health
	lifebar.value = $HealthComponent.current_health

func move_player(speed: float) -> void:
	var input_x = Input.get_axis("move_left", "move_right")
	var input_y = Input.get_axis("move_up", "move_down")
	velocity = Vector2(input_x, input_y).normalized() * speed
	move_and_slide()

func is_moving() -> bool:
	return velocity != Vector2.ZERO

## Looks at mouse. Created because some states may not want this beaviour.
func look_at_mouse() -> void:
	look_at(get_global_mouse_position())

func _process(_delta):
	PlayerGlobals.player_position = self.global_position


func _on_health_component_health_changed(new_value):
	lifebar_label.text = str(new_value)
	lifebar.value = new_value


func _on_health_component_health_reached_zero():
	get_tree().reload_current_scene()
