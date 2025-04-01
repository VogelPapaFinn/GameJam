extends StaticBody2D

func use(to_be_deleted : Usable) -> Usable:
    to_be_deleted.queue_free()
    return null 