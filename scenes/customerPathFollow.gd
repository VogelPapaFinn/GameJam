extends PathFollow2D

@export
var walking_speed = 20

func _process(delta: float) -> void:
	set_progress(get_progress() + walking_speed * delta)
