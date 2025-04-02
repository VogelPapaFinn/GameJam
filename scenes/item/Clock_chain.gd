class_name Clock_chain extends Clock_component

var raw_material: Raw_material.RAW_MATERIAL

var copper_sprite = preload("res://sprites/items/copper_chain.png")
var gold_sprite = preload("res://sprites/items/gold_chain.png")
var silver_sprite = preload("res://sprites/items/silver_chain.png")

func get_sprite() -> Resource:
	match raw_material:
		Raw_material.RAW_MATERIAL.COPPER: 
			return copper_sprite
		Raw_material.RAW_MATERIAL.GOLD: 
			return gold_sprite 
		Raw_material.RAW_MATERIAL.SILVER: 
			return silver_sprite 
	return 

func set_sprite():
	$Sprite2D.texture = get_sprite()

func hide():
	$Sprite2D.texture = null
