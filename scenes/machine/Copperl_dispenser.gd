extends StaticBody2D

func use(usable : Usable) -> Raw_material:
    if !usable:
        return null
    var new_mat = Raw_material.new()
    new_mat.material_name = Raw_material.RAW_MATERIAL.COPPER
    return new_mat