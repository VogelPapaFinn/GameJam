extends	Area2D

func _init():
	add_to_group("interact")

func interact(usable: Usable) -> Usable:
	if !usable:
		return null
	if !usable.is_in_group("finished"):
		return usable
	var	order: Clock_product = $".".get_parent().get_parent().get_order()
	if !order:
		return usable
	if usable.product.band.raw_material	!= order.band.raw_material:
		return usable
	if usable.product.shell.raw_material != order.shell.raw_material:
		return usable
	if usable.product.pointer.raw_material != order.pointer.raw_material:
		return usable
	$".".get_parent().get_parent().order_recieved()
	return null
