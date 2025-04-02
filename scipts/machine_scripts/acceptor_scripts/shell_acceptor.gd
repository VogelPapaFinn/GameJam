extends Area2D

var machine

func _init() -> void:
    self.add_to_group("interact")

func interact(item: Usable) -> Usable:
    if item is not Clock_shell:
        return item
    return machine.use(item)

