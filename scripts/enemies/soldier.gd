extends Enemy
class_name Soldier

@onready var nav_agent := $PlayerFollower as NavigationAgent2D
@export var movement_speed := 80.0
@export var stagger_amount := 5.0
@export var stop_following_dis := 140.0

var distance_to_player: float
var player_in_sight: bool

func _process(_delta):
	distance_to_player = global_position.distance_to(PlayerGlobals.player_position)
	player_in_sight = $RayCast2D.get_collider() is Player

func follow_player():
	if not player_in_sight or distance_to_player > stop_following_dis:
		var dir = position.direction_to(nav_agent.get_next_path_position())
		velocity = dir.normalized() * movement_speed
		move_and_slide()

func look_at_player() -> void:
	look_at(PlayerGlobals.player_position)

func stagger():
	velocity -= transform.x * stagger_amount
	move_and_slide()

func _on_health_component_health_reached_zero():
	queue_free()
