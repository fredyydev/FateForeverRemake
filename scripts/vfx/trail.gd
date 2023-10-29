extends Line2D
class_name Trail

var rng = RandomNumberGenerator.new()
var remove_time: float

func _ready():
	rng.randomize()
	remove_time = rng.randf_range(0.04, 0.07)

func _physics_process(_delta):
	add_point(owner.global_position)
	await get_tree().create_timer(remove_time).timeout
	remove_point(0)
