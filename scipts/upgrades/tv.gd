extends Button

@export var tv_label: Label
var tv_scene = preload("res://scenes/upgrades/tv.tscn")
var cost = 15

func _ready() -> void:
	self.text = self.text + " - $" + str(cost)

func _on_mouse_enter():
	tv_label.visible = true

func _on_mouse_exit():
	tv_label.visible = false

func _on_pressed():
	var money = Scenemanager.money_display.get_money()
	if money >= cost:
		Scenemanager.money_display.add_money(-cost)
		var tv_instance = tv_scene.instantiate()
		tv_instance.set_position(Vector2(324.0, 288.0))
		tv_instance.set_scale(Vector2(2.0, 2.0))
		tv_instance.z_index = 1
		add_child(tv_instance)
		tv_instance.visible = true
		self.set_disabled(true)
		$"../../../Path2D"._on_tv_btn_pressed()
		self.release_focus()
