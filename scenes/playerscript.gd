extends CharacterBody2D

@export var is_player_2 : bool = false

@export var PLAYER_SPEED = 20000
@onready var sprite = $AnimatedPlayerSprite

enum Direction {LEFT, RIGHT, UP, DOWN}
enum Moving {IDLE, MOVING }

var current_inventory: inventory
const inventory_display_position = Vector2(1202, 165)

# Define initial walking states
var current_state = Moving.IDLE
var last_direction = Direction.DOWN

func _ready() -> void:
	if is_player_2:
		Scenemanager.pl2 = self
	else:
		Scenemanager.pl1 = self
	current_inventory = inventory.new()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact") or (is_player_2 and Input.is_action_just_pressed("pl2interact")):
		var areas = $PickupArea.get_overlapping_areas()
		var current_area : Area2D
		if len(areas) != 0:
			current_area= areas[0]
		if current_area and current_area.is_in_group("interact"):
			var cur_item = current_inventory.get_item()
			var new_item = current_area.interact(cur_item)
			current_inventory.set_item(new_item)
	var current_item = current_inventory.get_item()
	if current_item:
		var above_head_pos = position
		above_head_pos = Vector2(above_head_pos.x, above_head_pos.y - 50)
		$Inventory_Display.global_position = above_head_pos 
		if current_item is not Finished_clock:
			$Inventory_Display.texture = current_item.get_sprite()
		else:
			$Inventory_Display.add_child(current_item)
	else:
		$Inventory_Display.texture = null
		for child in $Inventory_Display.get_children():
			child.queue_free()

func _physics_process(delta: float) -> void:
	var direction
	if !is_player_2:
		direction = Input.get_vector("Left", "Right", "Up", "Down")
	else:
		direction = Input.get_vector("pl2left", "pl2right", "pl2up", "pl2down")
	velocity = direction * PLAYER_SPEED *delta
	set_animation(direction)
	move_and_slide()

# play correct walking/idle animation
func set_animation(direction):
	if not current_inventory.get_item():
		if direction.y > 0.5:
			current_state = Moving.MOVING
			last_direction = Direction.DOWN
			sprite.play("moving_down")
		elif direction.y < 0:
			current_state = Moving.MOVING
			last_direction = Direction.UP
			sprite.play("moving_up")
		elif direction.x > 0:
			current_state = Moving.MOVING
			last_direction = Direction.RIGHT
			sprite.play("moving_right")
		elif direction.x < 0:
			current_state = Moving.MOVING
			last_direction = Direction.LEFT
			sprite.play("moving_left")
			
		else:
			current_state = Moving.IDLE
			if last_direction == Direction.DOWN:
				sprite.play("idle_down")
			elif last_direction == Direction.UP:
				sprite.play("idle_up")
			elif last_direction == Direction.LEFT:
				sprite.play("idle_left")
			elif last_direction == Direction.RIGHT:
				sprite.play("idle_right")
	else:
		if direction.y > 0.5:
			current_state = Moving.MOVING
			last_direction = Direction.DOWN
			sprite.play("moving_down_holding_item")
		elif direction.y < 0:
			current_state = Moving.MOVING
			last_direction = Direction.UP
			sprite.play("moving_up_holding_item")
		elif direction.x > 0:
			current_state = Moving.MOVING
			last_direction = Direction.RIGHT
			sprite.play("moving_right_holding_item")
		elif direction.x < 0:
			current_state = Moving.MOVING
			last_direction = Direction.LEFT
			sprite.play("moving_left_holding_item")
			
		else:
			current_state = Moving.IDLE
			if last_direction == Direction.DOWN:
				sprite.play("idle_down_holding_item")
			elif last_direction == Direction.UP:
				sprite.play("idle_up_holding_item")
			elif last_direction == Direction.LEFT:
				sprite.play("idle_left_holding_item")
			elif last_direction == Direction.RIGHT:
				sprite.play("idle_right_holding_item")
