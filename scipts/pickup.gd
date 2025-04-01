extends  Area2D

var resource: Resource

func _init() -> void:
    self.add_to_group("Pickup")

func pickup() -> Resource:
    return resource 