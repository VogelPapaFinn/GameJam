extends Area2D

var machine

func _init() -> void:
	self.add_to_group("interact")

func interact(item: Usable) -> Usable:
	print("interact", machine)
	return machine.use(item)