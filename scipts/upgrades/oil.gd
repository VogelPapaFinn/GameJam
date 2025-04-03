extends Button

@export var oil_label: Label
var cost = 15

func _ready() -> void:
	self.text = self.text + "$" + str(cost)

func _on_mouse_enter():
	oil_label.visible = true

func _on_mouse_exit():
	oil_label.visible = false

func _on_pressed():
	var money = Scenemanager.money_display.get_money()
	if money >= cost:
		Scenemanager.money_display.add_money(-cost)
		self.set_disabled(true)
		$"../../../Pointer_creator"._on_oil_btn_pressed()
		$"../../../Shell_creator"._on_oil_btn_pressed()
		$"../../../Chain_creator"._on_oil_btn_pressed()
		$checkmark.visible = true
		self.release_focus()
