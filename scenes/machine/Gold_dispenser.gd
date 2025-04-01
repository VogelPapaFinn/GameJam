extends StaticBody2D


func _ready():
    $InteractionArea.machine = self

func use(usable : Usable) -> Raw_material:
    if !usable:
        return null
    var new_mat = Raw_material.new()
    new_mat.material_name = Raw_material.RAW_MATERIAL.GOLD
    return new_mat