extends Area2D

var machine

func interact(item: Usable) -> void:
    machine.use()
