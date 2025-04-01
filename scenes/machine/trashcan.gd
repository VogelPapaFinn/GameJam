extends StaticBody2D

func use(to_be_deleted : Usable) -> bool:
    to_be_deleted.queue_free()
    return true