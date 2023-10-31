extends Line2D
class_name Trail

var rng = RandomNumberGenerator.new()
var remove_time: float

func _ready():
	rng.randomize()
	remove_time = rng.randf_range(0.02, 0.05)
	$Timer.wait_time = remove_time
	$Timer.start()
	add_point(owner.global_position)

func _physics_process(_delta):
	add_point(owner.global_position)


func _on_timer_timeout():
	remove_point(0)
