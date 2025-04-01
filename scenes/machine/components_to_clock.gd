extends StaticBody2D

func use(prod : Product) -> Clock:
    var new_clock = Clock.new()
    new_clock.components = prod.components
    return new_clock