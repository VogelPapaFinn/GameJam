extends	StaticBody2D

@export var timer_length = 3
var in_progress = false

var	current_shell: Clock_shell
var	current_pointer: Clock_pointer
var	current_chain: Clock_chain
var	finished_product
var display_shell
var display_pointer
var display_chain
var	finished_clock	= preload("res://scenes/item/finished_clock.tscn")
var chain = preload("res://scenes/item/chain.tscn")
#var shell = preload("res://scenes/item/Clock_shell.gd")
var shell = preload("res://scenes/shell.tscn")
var pointer = preload("res://scenes/pointer.tscn")
var move_items: bool = false

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
		
		# Display Sprite on Conveyor Belt
		display_shell = shell.instantiate()
		add_child(display_shell)
		display_shell.raw_material = current_shell.raw_material
		display_shell.global_position = $shell_position.global_position
		display_shell.set_sprite()
		
		check_for_full()
		return null
	elif item.is_in_group("pointer"):
		if current_pointer:
			return item
		current_pointer	= item
		
		# Display Sprite on Conveyor Belt
		display_pointer = pointer.instantiate()
		add_child(display_pointer)
		display_pointer.raw_material = current_pointer.raw_material
		display_pointer.global_position = $pointer_position.global_position
		display_pointer.set_sprite()
		
		check_for_full()
		return null
	elif item.is_in_group("chain"):
		if current_chain:
			return item
		current_chain =	item
		
		# Display Sprite on Conveyor Belt
		display_chain = chain.instantiate()
		add_child(display_chain)
		display_chain.raw_material = current_chain.raw_material
		display_chain.global_position = $chain_position.global_position
		display_chain.set_sprite()
		
		check_for_full()
		return null
	else:
		print("match fialed")
		print(item.get_groups())
		return item

func check_for_full():
	if current_chain and current_pointer and current_shell:
		move_items = true
		
		
		$Timer.wait_time = timer_length
		print($Timer.wait_time)
		$Timer.start()
		$AnimatedSprite2D.play("working")
		in_progress = true
		
		
		
func pick_up() -> Usable:
	var	tmp	= finished_product
	finished_product = null
	return tmp

func _on_timer_timeout() -> void:
	#print("timer ended")
	move_items = false
	in_progress = false
	
	$AnimatedSprite2D.play("idle")
	
	var	new_clock =	finished_clock.instantiate()
	new_clock.get_node("shell").texture = current_shell.get_sprite()
	new_clock.get_node("chain").texture = current_chain.get_finished_sprite()
	new_clock.get_node("pointer").texture = current_pointer.get_finished_sprite()
	
	new_clock.position = $Finished_position.position
	finished_product = new_clock
	

func _process(delta: float) -> void:
	if move_items:
		if display_chain.position.y < $component_end_position.position.y:
			#print(display_chain.position.y)
			#print($component_end_position.global_position.y)
			display_chain.position.y = display_chain.position.y + 1
		else:
			display_chain.visible = false
		if display_pointer.position.y < $component_end_position.position.y:
			display_pointer.position.y = display_pointer.position.y + 1
		else:
			display_pointer.visible = false
		if display_shell.position.y < $component_end_position.position.y:
			display_shell.position.y = display_shell.position.y + 1
		else:
			display_shell.visible = false
