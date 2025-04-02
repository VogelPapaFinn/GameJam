extends Path2D

var generated_children = []
@export var character_scene: PackedScene = preload("res://scenes/customer/customer.tscn")
@export var character_count: int = 3  # Number of characters to spawn
var queue_count: int = 0

func _ready():
	var timer = Timer.new()
	timer.wait_time = 1.0
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	if queue_count < 3:
		spawn_character(queue_count)
		queue_count += 1

func on_customer_leave():
	if queue_count > 0:
		queue_count -= 1
		for child in generated_children:
			if child:
				child.update_queue()

func spawn_character(id: int = 0):
	# Create a PathFollow2D instance for the character
	var path_follow = PathFollow2D.new()
	path_follow.set_script(load("res://scenes/customer/customerPathFollow.gd"))
	path_follow.init(id)
	path_follow.progress = 0.0
	path_follow.rotates = false
	path_follow.loop = false
	# Instantiate the character and attach it to the path_follow
	var character = character_scene.instantiate()
	character.set_z_index(2)
	path_follow.add_child(character)  # Add character to PathFollow2D
	add_child(path_follow)
	generated_children.append(path_follow)

	# Start movement for the character
	path_follow.start_moving()
