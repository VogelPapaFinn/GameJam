extends StaticBody2D

func _ready():
    $InteractionArea.machine = self
    $InteractionArea.add_to_group("trash")

func use(to_be_deleted : Usable) -> Usable:
    to_be_deleted.queue_free()
    return null 
