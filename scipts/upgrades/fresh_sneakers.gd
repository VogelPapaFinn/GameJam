extends Button

@export var sneakers_label: Label

func _on_mouse_enter():
	sneakers_label.visible = true

func _on_mouse_exit():
	sneakers_label.visible = false

func _on_pressed():
	pass
