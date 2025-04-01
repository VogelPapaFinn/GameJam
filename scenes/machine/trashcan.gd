extends StaticBody2D

func _ready():
    $InteractionArea.machine = self

func use(to_be_deleted : Usable) -> Usable:
    to_be_deleted.queue_free()
    return null 
