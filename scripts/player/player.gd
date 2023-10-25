extends CharacterBody2D
class_name Player

##Keeps track of dash cooldown.
var can_dash := true

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
