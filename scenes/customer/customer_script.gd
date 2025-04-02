extends Node

@export var animated_sprite_2d: AnimatedSprite2D
@export var collision_shape_2d: CollisionShape2D

func change_state(state: CustomerState.CUSTOMERSTATE):
	match state:
		CustomerState.CUSTOMERSTATE.WALKING:
			animated_sprite_2d.play("Walking")
		CustomerState.CUSTOMERSTATE.OREDERING:
			animated_sprite_2d.play("Ordering")
		CustomerState.CUSTOMERSTATE.WAITING:
			animated_sprite_2d.play("Waiting_patient")
		CustomerState.CUSTOMERSTATE.IMPATIENT:
			animated_sprite_2d.play("Waiting_impatient")
		CustomerState.CUSTOMERSTATE.ANGRY:
			animated_sprite_2d.play("Waiting_angry")
		CustomerState.CUSTOMERSTATE.ANGRYWALKING:
			animated_sprite_2d.play("Walking_angry")
