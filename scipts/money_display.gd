extends Node2D

@export var money_counter: int = 100:
	set(new_value):
		money_counter = new_value
		_on_money_changed()

func _ready() -> void:
	Scenemanager.money_display = self
	$Label.text = "$" + str(money_counter)

func get_money() -> int:
	return money_counter

func add_money(amount: int):
	money_counter += amount

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

func _on_money_changed():
	$Label.text = "$" + str(money_counter)
