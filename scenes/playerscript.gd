extends CharacterBody2D

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
	set_animation(direction)
	move_and_slide()

# play correct walking/idle animation
func set_animation(direction):	
	if direction.x > 0:
		current_state = Moving.MOVING
		last_direction = Direction.RIGHT
		sprite.play("run down")
#	elif direction.x < 0:
#		current_state = Moving.MOVING
#		last_direction = Direction.LEFT
#		sprite.play("run left")
#	elif direction.y > 0:
#		current_state = Moving.MOVING
#		last_direction = Direction.DOWN
#		sprite.play("run down")
#	elif direction.y < 0:
#		current_state = Moving.MOVING
#		last_direction = Direction.UP
#		sprite.play("run up")
		
	else:
		current_state = Moving.IDLE
		if last_direction == Direction.DOWN:
			sprite.play("idle_down")
#		elif last_direction == Direction.UP:
#			sprite.play("idle up")
#		elif last_direction == Direction.LEFT:
#			sprite.play("idle left")
#		elif last_direction == Direction.RIGHT:
#			sprite.play("idle right")
