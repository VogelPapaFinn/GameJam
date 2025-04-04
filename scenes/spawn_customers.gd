extends Path2D

var generated_children = []
@export var character_scene: PackedScene = preload("res://scenes/customer/customer.tscn")
@export var character_max_count: int = 3  # Number of characters to spawn
var queue_count: int = 0
var wait_time: float = 100.0 
var timer: Timer
var difficulty_timer: Timer

func _ready():
	timer = Timer.new()
	timer.wait_time = 1.0
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
	difficulty_timer = Timer.new()
	difficulty_timer.wait_time = 60.0
	difficulty_timer.one_shot = false
	add_child(difficulty_timer)
	difficulty_timer.timeout.connect(_on_difficulty_increase)
	difficulty_timer.start()

func _on_timer_timeout():
	spawn_character(queue_count)

func _on_difficulty_increase():
	if wait_time > 20:
		wait_time -= 20
	if character_max_count < 5:
		character_max_count += 1
	for child in generated_children:
			if child:
				if  child.counter_num < 5:
					child.counter_num += 1

func on_customer_leave(qid):
	if queue_count > 0:
		queue_count -= 1
		for child in generated_children:
			if child:
				child.update_queue(qid)

func spawn_character(id: int = 0):
	if queue_count >= character_max_count:
		return
	queue_count += 1
	# Create a PathFollow2D instance for the character
	var path_follow = PathFollow2D.new()
	path_follow.set_script(load("res://scenes/customer/customerPathFollow.gd"))
	path_follow.progress = 0.0
	path_follow.rotates = false
	path_follow.loop = false
	# Instantiate the character and attach it to the path_follow
	var character = character_scene.instantiate()
	character.set_z_index(2)
	path_follow.add_child(character)  # Add character to PathFollow2D
	path_follow.init(id, character, wait_time)
	add_child(path_follow)
	generated_children.append(path_follow)
	# Start movement for the character
	path_follow.start_moving()

func _on_tv_btn_pressed():
	wait_time *= 1.5
