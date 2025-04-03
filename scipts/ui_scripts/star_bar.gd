extends Control

const default_angry_deduction = 1
const default_happy_deduction = 1
const default_wrong_deduction = 1.5

func _ready() -> void:
	Scenemanager.star_manager = self

func customer_left_angry():
	var random_deduction = randf_range(-0.5, 0.5)
	var change = - default_angry_deduction + random_deduction
	update_stars(change)


func customer_left_happy(time_waited: float, max_time: float):
	var random_addition= randf_range(-0.5, 0.5)
	var time_waited_bonus = max_time / time_waited 
	var change = default_happy_deduction + random_addition + time_waited_bonus 
	
	update_stars(change)


func customer_got_wrong_order():
	var random_deduction = randf_range(-0.5, 0.5)
	var change = default_wrong_deduction + random_deduction
	update_stars(change)


func update_stars(change: int):
	$TextureProgressBar.value += change 
	if $TextureProgressBar.value <= 0:
		zero_stars()

func zero_stars():
	pass
