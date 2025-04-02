extends Node2D

signal button_pressed

@onready var sneakers_button = $"GUIRoot/UpgradesMenu/Fresh Sneakers"

func _ready():
	var player = get_parent().get_node("Player")
	if player:
		sneakers_button.connect("pressed", player._on_sneakers_btn_pressed)

#func _on_oil_button_pressed():
	#emit_signal("oil_button_pressed")
