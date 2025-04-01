extends CharacterBody2D

@export var PLAYER_SPEED = 20000

enum Direction {LEFT, RIGHT, UP, DOWN}
enum Moving {IDLE, MOVING }

var current_inventory: inventory

func _ready() -> void:
	Scenemanager.player = self
	current_inventory = inventory.new()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		var areas = $PickupArea.get_overlapping_areas()
		var current_area : Area2D
		if len(areas) == 1 :
			current_area= areas[0]
		if current_area and current_area.is_in_group("interact"):
			if current_inventory.get_count() != 0:
				current_inventory.set_item(current_area.interact(current_inventory.get_item()))


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * PLAYER_SPEED *delta
	move_and_slide()
