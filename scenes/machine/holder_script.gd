extends	Node2D

var	current_usable
var	display

var	chain_scene	= preload("res://scenes/item/chain.tscn")
var	shell_scene	= preload("res://scenes/shell.tscn")
var	pointer_scene =	preload("res://scenes/pointer.tscn")
var raw_scene = preload("res://scenes/item/raw_material.tscn")

func _ready() -> void:
	$Area2D.machine	= self

func use(usable: Usable) -> Usable:
	if current_usable and !usable:
		var tmp = current_usable
		remove_item()
		return tmp
	if usable and !current_usable:
		current_usable = usable
		var succ = display_item()
		if !succ:
			return usable
		return null
	return usable

func display_item()	-> bool:
	if current_usable.is_in_group("shell"):
		display	= shell_scene.instantiate()
		display.raw_material = current_usable.raw_material
	if current_usable.is_in_group("pointer"):
		display	= pointer_scene.instantiate()
		display.raw_material = current_usable.raw_material
	if current_usable.is_in_group("chain"):
		display	= pointer_scene.instantiate()
		display.raw_material = current_usable.raw_material
	if !display: 
		return false
	display.global_position	= $Holderposition.global_position
	display.set_sprite()
	return true

func remove_item() -> void:
	current_usable = null
	display = null
	for	child in get_children():
		child.queue_free()
