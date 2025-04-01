class_name Raw_material extends Usable 

enum RAW_MATERIAL {GOLD = 1, SILVER = 2, COPPER = 3}

var material_name: RAW_MATERIAL 

var gold_sprite = preload("res://sprites/items/gold_lump.png")
var silver_sprite = preload("res://sprites/items/silver_lump.png")
var copper_sprite = preload("res://sprites/items/copper_lump.png")

func get_sprite() -> Resource:
    match material_name:
        RAW_MATERIAL.GOLD:
            return gold_sprite
        RAW_MATERIAL.SILVER:
            return silver_sprite
        RAW_MATERIAL.COPPER:
            return copper_sprite
    return null