class_name Clock_band extends Clock_component

var raw_material : Raw_material

func get_sprite() -> Sprite2D:
    match raw_material:
        Raw_material.RAW_MATERIAL.COPPER: 
            return 
        Raw_material.RAW_MATERIAL.GOLD: 
            return 
        Raw_material.RAW_MATERIAL.SILVER: 
            return 
    return 