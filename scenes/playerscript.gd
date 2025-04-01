extends CharacterBody2D

@export var PLAYER_SPEED = 200

enum Direction {LEFT, RIGHT, UP, DOWN}
enum Moving {IDLE, MOVING }

var inventory

func _ready() -> void:
    Scenemanager.player = self
    inventory = inventory.new()

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("Interact"):
        var areas = $PickupArea.get_overlapping_areas()
        var current_area : Area2D
        if len(areas) == 1 :
            current_area= areas[0]
        else:
            pass
        if current_area.is_in_group("Pickup"):
            if inventory.get_count == 0:
                inventory.pickup(current_area.pickup())
        elif current_area.is_in_group("Place"):
            if inventory.get_count == 1:
                inventory.place()


func _physics_process(delta: float) -> void:
    var direction = Input.get_vector("Left", "Right", "Up", "Down")
    velocity = direction * PLAYER_SPEED *delta
    move_and_slide()

