extends Node2D

signal button_pressed

@onready var sneakers_button = $"GUIRoot/UpgradesMenu/Fresh Sneakers"
@onready var oil_button = $GUIRoot/UpgradesMenu/Oil

#func _ready():
	#var player1 = get_parent().get_node("pl1")
	#var player2 = get_parent().get_node("pl2")
	#sneakers_button.connect("pressed", player1._on_sneakers_btn_pressed)
	#sneakers_button.connect("pressed", player2._on_sneakers_btn_pressed)
#
	#oil_button.connect("pressed", $Chain_creator._on_oil_btn_pressed)
	#oil_button.connect("pressed", $Pointer_creator._on_oil_btn_pressed)
	#oil_button.connect("pressed", $Shell_creator._on_oil_btn_pressed)
