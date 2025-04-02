extends	Area2D

func _init():
	add_to_group("interact")

func interact(usable: Usable) -> Usable:
	if !usable:
		print("is null")
		return null
	print("interacted")
	if !usable.is_in_group("finished"):
		print("not in group")
		return usable
	print("is_clock")
	var	order: Clock_product = $".".get_parent().get_parent().get_order()
	if !order:
		return usable
	if usable.product.band.raw_material	!= order.band.raw_material:
		print(usable.product.band.raw_material)
		print(order.band.raw_material)
		print("not right band")
		return usable
	if usable.product.shell.raw_material != order.band.raw_material:
		print("not right shell")
		return usable
	if usable.product.pointer.raw_material != order.band.raw_material:
		print("not right pointer")
		return usable
	$".".get_parent().get_parent().order_recieved()
	return null
