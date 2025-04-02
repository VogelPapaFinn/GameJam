extends CharacterBody2D

@export var PLAYER_SPEED = 20000

enum Direction {LEFT, RIGHT, UP, DOWN}
enum Moving {IDLE, MOVING }

var current_inventory: inventory
const inventory_display_position = Vector2(1202, 165)

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
			var current_item = current_inventory.get_item()
			var new_item = current_area.interact(current_item)
			current_inventory.set_item(new_item)
	var current_item = current_inventory.get_item()
	if current_item:
		$Inventory_Display.global_position = inventory_display_position
		$Inventory_Display.texture = current_item.get_sprite()
	else:
		$Inventory_Display.texture = null

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * PLAYER_SPEED *delta
	move_and_slide()
