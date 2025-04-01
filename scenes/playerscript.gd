extends CharacterBody2D

@export var PLAYER_SPEED = 200

enum Direction {LEFT, RIGHT, UP, DOWN}
enum Moving {IDLE, MOVING }

func _ready() -> void:
    Scenemanager.player = self

func _process(delta: float) -> void:
    if Input.is_action_just_pressed("Interact"):
        var areas = $PickupArea.get_overlapping_areas()
        var current_inventory
        for area in areas:
            pass # Pickup the correspondin material
        if  

func _physics_process(delta: float) -> void:
    var direction = Input.get_vector("Left", "Right", "Up", "Down")
    velocity = direction * PLAYER_SPEED *delta
    move_and_slide()

