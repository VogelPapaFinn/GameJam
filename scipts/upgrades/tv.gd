extends Button

@export var tv_label: Label
var tv_scene = preload("res://scenes/upgrades/tv.tscn")

#func _ready():
	#tv_scene.z_index = 1
	#tv_scene.trans

func _on_mouse_enter():
	tv_label.visible = true

func _on_mouse_exit():
	tv_label.visible = false

func _on_pressed():
	# TODO: check if enough currency
	var tv_instance = tv_scene.instantiate()
	tv_instance.set_position(Vector2(324.0, 288.0))
	tv_instance.set_scale(Vector2(2.0, 2.0))
	tv_instance.z_index = 1
	add_child(tv_instance)
	tv_instance.visible = true
	self.set_disabled(true)
	self.set_text_alignment(HORIZONTAL_ALIGNMENT_LEFT)
	$checkmark.visible = true
	self.release_focus()
