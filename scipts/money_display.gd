extends Node2D

var money_counter = 0

func _ready() -> void:
	Scenemanager.money_display = self
	$Label.text = "$" + str(money_counter)

func order_complete(order: Clock_product):
	match order.band.raw_material:
		Raw_material.RAW_MATERIAL.GOLD:
			money_counter += 3
		Raw_material.RAW_MATERIAL.SILVER:
			money_counter += 2
		Raw_material.RAW_MATERIAL.COPPER:
			money_counter += 1
	match order.pointer.raw_material:
		Raw_material.RAW_MATERIAL.GOLD:
			money_counter += 3
		Raw_material.RAW_MATERIAL.SILVER:
			money_counter += 2
		Raw_material.RAW_MATERIAL.COPPER:
			money_counter += 1
	match order.shell.raw_material:
		Raw_material.RAW_MATERIAL.GOLD:
			money_counter += 3
		Raw_material.RAW_MATERIAL.SILVER:
			money_counter += 2
		Raw_material.RAW_MATERIAL.COPPER:
			money_counter += 1
	$Label.text = "$" + str(money_counter)
