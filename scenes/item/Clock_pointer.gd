class_name Clock_pointer extends Clock_component

var raw_material: Raw_material.RAW_MATERIAL


func get_sprite() -> Sprite2D:
    match raw_material:
        Raw_material.RAW_MATERIAL.COPPER: 
            return 
        Raw_material.RAW_MATERIAL.GOLD: 
            return 
        Raw_material.RAW_MATERIAL.SILVER: 
            return 
    return 