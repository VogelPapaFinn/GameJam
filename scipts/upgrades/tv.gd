extends Button

@export var tv_label: Label

func _on_mouse_enter():
	tv_label.visible = true

func _on_mouse_exit():
	tv_label.visible = false
