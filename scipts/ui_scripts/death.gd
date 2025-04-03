extends Control

@onready var tween_silver : Tween = get_tree().create_tween()
@onready var tween_gold : Tween = get_tree().create_tween()
@onready var tween_copper : Tween = get_tree().create_tween()

var initGold : bool = false
var initCopper : bool = false

func _ready():
	# Get highscore
	$CanvasLayer2/VBoxContainer/highscore.text = "HIGSCHORE: " + Scenemanager.highscore
	
	reverseSilverTween()
	reverseGoldTween()
	reverseCopperTween()
	
func reverseSilverTween():
	if($Background/Silver.position == Vector2(0, -16)):
		tween_silver = get_tree().create_tween()
		tween_silver.tween_property($Background/Silver, "position", Vector2(0, 16), 5).set_trans(Tween.TRANS_QUAD)
		tween_silver.finished.connect(reverseSilverTween)
		tween_silver.play()
		
		if !initGold:
			initGold = true
			tween_gold.play()
	else:
		tween_silver = get_tree().create_tween()
		tween_silver.tween_property($Background/Silver, "position", Vector2(0, -16), 5).set_trans(Tween.TRANS_QUAD)
		tween_silver.finished.connect(reverseSilverTween)
		tween_silver.play()
		
func reverseGoldTween():
	if($Background/Gold.position == Vector2(0, 16)):
		tween_gold = get_tree().create_tween()
		tween_gold.tween_property($Background/Gold, "position", Vector2(0, -16), 4).set_trans(Tween.TRANS_QUAD)
		tween_gold.finished.connect(reverseGoldTween)
		tween_gold.play()
		
		if !initCopper:
			initCopper = true
			tween_copper.play()
	else:
		tween_gold = get_tree().create_tween()
		tween_gold.tween_property($Background/Gold, "position", Vector2(0, 16), 4).set_trans(Tween.TRANS_QUAD)
		tween_gold.finished.connect(reverseGoldTween)
		tween_gold.play()
		
func reverseCopperTween():
	if($Background/Copper.position == Vector2(0, 16)):
		tween_copper = get_tree().create_tween()
		tween_copper.tween_property($Background/Copper, "position", Vector2(0, -16), 6).set_trans(Tween.TRANS_QUAD)
		tween_copper.finished.connect(reverseCopperTween)
		tween_copper.play()
	else:
		tween_copper = get_tree().create_tween()
		tween_copper.tween_property($Background/Copper, "position", Vector2(0, 16), 6).set_trans(Tween.TRANS_QUAD)
		tween_copper.finished.connect(reverseCopperTween)
		tween_copper.play()

func onRestart():
	get_tree().change_scene_to_file("res://scenes/MainNode.tscn")
	
func onExit():
	get_tree().quit()
	
