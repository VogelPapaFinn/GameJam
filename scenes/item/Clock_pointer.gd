class_name Clock_pointer extends Clock_component

var raw_material: Raw_material.RAW_MATERIAL

var copper_sprite = load("res://sprites/items/copper_clock_hands.png")
var gold_sprite = load("res://sprites/items/gold_clock_hands.png")
var silver_sprite = load("res://sprites/items/silver_clock_hands.png")

var fin_copper = load("res://sprites/items/copper_clock_hands_on_shell.png")
var fin_gold = load("res://sprites/items/gold_clock_hands_on_shell.png")
var fin_silver = load("res://sprites/items/silver_clock_hands_on_shell.png")

func _ready() -> void:
	self.add_to_group("pointer")

func get_sprite() -> Resource:
	match raw_material:
		Raw_material.RAW_MATERIAL.COPPER: 
			return copper_sprite
		Raw_material.RAW_MATERIAL.GOLD: 
			return gold_sprite 
		Raw_material.RAW_MATERIAL.SILVER: 
			return silver_sprite 
	return 

func get_finished_sprite() -> Resource:
	match raw_material:
		Raw_material.RAW_MATERIAL.COPPER: 
			return fin_copper 
		Raw_material.RAW_MATERIAL.GOLD: 
			return fin_gold 
		Raw_material.RAW_MATERIAL.SILVER: 
			return fin_silver 
	return 

func set_sprite():
	$Sprite2D.texture = get_sprite()

func hide():
	$Sprite2D.texture = null
