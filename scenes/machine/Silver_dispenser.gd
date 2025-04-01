extends StaticBody2D

func _ready():
    $InteractionArea.machine = self

func use(usable : Usable) -> Usable:
    if usable:
        return usable 
    var new_mat = Raw_material.new()
    new_mat.material_name = Raw_material.RAW_MATERIAL.SILVER
    return new_mat