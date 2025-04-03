extends Button

@export var sneakers_label: Label
var cost = 15

func _ready() -> void:
	self.text = self.text + " - $" + str(cost)

func _on_mouse_enter():
	sneakers_label.visible = true

func _on_mouse_exit():
	sneakers_label.visible = false

func _on_pressed():
	var money = Scenemanager.money_display.get_money()
	if money >= cost:
		Scenemanager.money_display.add_money(-cost)
		self.set_disabled(true)
		Scenemanager.pl1._on_sneakers_btn_pressed()
		Scenemanager.pl2._on_sneakers_btn_pressed()
