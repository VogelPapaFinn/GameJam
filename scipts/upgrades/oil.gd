extends Button

@export var oil_label: Label

func _on_mouse_enter():
	oil_label.visible = true

func _on_mouse_exit():
	oil_label.visible = false
