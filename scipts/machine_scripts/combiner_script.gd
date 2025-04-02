extends	StaticBody2D

var	current_shell: Clock_shell
var	current_pointer: Clock_pointer
var	current_chain: Clock_chain
var	finished_product
var	finished_clock	= preload("res://scenes/item/finished_clock.tscn")

func _ready() -> void:
	$Chain_area.machine	= self
	$Pointer_area.machine =	self
	$Shell_area.machine	= self
	$Pickup_area.machine = self

func use(item: Usable) -> Usable:
	if item.is_in_group("shell"):
		if current_shell:
			return item
		current_shell =	item
		check_for_full()
		return null
	elif item.is_in_group("pointer"):
		if current_pointer:
			return item
		current_pointer	= item
		check_for_full()
		return null
	elif item.is_in_group("chain"):
		if current_chain:
			return item
		current_chain =	item
		check_for_full()
		return null
	else:
		print("match fialed")
		print(item.get_groups())
		return item

func check_for_full():
	if current_chain and current_pointer and current_shell:
		var	new_clock =	finished_clock.instantiate()
		new_clock.get_node("shell").texture = current_shell.get_sprite()
		new_clock.get_node("chain").texture = current_chain.get_finished_sprite()
		new_clock.get_node("pointer").texture = current_pointer.get_finished_sprite()
		new_clock.position = $Finished_position.global_position
		new_clock.add_to_group("finished")
		new_clock.product = Clock_product.new(current_chain, current_shell, current_pointer)
		finished_product = new_clock
		current_shell = null
		current_pointer = null
		current_chain = null
		
func pick_up() -> Usable:
	var	tmp	= finished_product
	finished_product = null
	return tmp
