extends Node

const MAX_MATERIAL = 3

func generate_order() -> Clock_product:
    var new_pointer = Clock_pointer.new()
    var pmaterial = randi_range(1,MAX_MATERIAL)
    new_pointer.raw_material = pmaterial
    var new_shell = Clock_shell.new()
    var smaterial = randi_range(1,MAX_MATERIAL)
    new_shell.raw_material = smaterial
    var new_band = Clock_band.new()
    var bmaterial = randi_range(1, MAX_MATERIAL)
    new_band.raw_material = bmaterial
    var product = Clock_product.new()
    product.components = [new_pointer, new_shell, new_band]
    return product

