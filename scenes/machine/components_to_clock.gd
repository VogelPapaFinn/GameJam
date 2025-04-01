extends StaticBody2D

func use(prod : Clock_product) -> Finished_clock:
    var new_clock = Finished_clock.new()
    new_clock.components = prod.components
    return new_clock