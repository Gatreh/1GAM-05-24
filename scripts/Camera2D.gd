extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.lerp(get_target_position(), (15 * delta))
	if global_position.distance_to(get_target_position()) <= 5:
		position = position.round()
