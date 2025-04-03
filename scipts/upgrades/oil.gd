extends Button

@export var oil_label: Label

func _on_mouse_enter():
	oil_label.visible = true

func _on_mouse_exit():
	oil_label.visible = false

func _on_pressed():
	self.disabled = true
	self.set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	$checkmark.visible = true
	self.release_focus()
