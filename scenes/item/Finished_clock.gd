class_name Finished_clock extends Usable

var product : Clock_product 

func compare_clocks(order: Finished_clock) -> bool:
    if order.product.band.raw_material != product.band.raw_material:
        return false
    if order.product.shell.raw_material != product.shell.raw_material:
        return false
    if order.product.pointer.raw_material != product.pointer.raw_material:
        return false
    return true

