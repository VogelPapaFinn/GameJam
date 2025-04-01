extends Path2D

@export var character_scene: PackedScene  # Assign the character scene (PathFollow2D) in the editor
@export var character_count: int = 3  # Number of characters to spawn
#@onready var path2d = $Path2D

func _ready():
	for i in range(character_count):
		spawn_character(i * 100.0)  # Adjust the starting position for each character

func spawn_character(start_position: float):
	# Create a PathFollow2D instance for the character
	var path_follow = PathFollow2D.new()
	path_follow.set_script(load("res://scenes/customer/customerPathFollow.gd"))
	path_follow.progress = start_position  # Set different starting positions
	path_follow.rotates = false
	path_follow.loop = false
	# Instantiate the character and attach it to the path_follow
	var character = character_scene.instantiate()
	character.set_z_index(2) 
	path_follow.add_child(character)  # Add character to PathFollow2D
	add_child(path_follow)

	# Start movement for the character
	path_follow.start_moving()
