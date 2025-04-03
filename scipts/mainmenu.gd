extends Control

@onready var tween_silver : Tween = get_tree().create_tween()
@onready var tween_gold : Tween = get_tree().create_tween()
@onready var tween_copper : Tween = get_tree().create_tween()

var initGold : bool = false
var initCopper : bool = false

func _ready():
	reverseSilverTween()
	reverseGoldTween()
	reverseCopperTween()
	
func reverseSilverTween():
	if($Background_1/Silver.position == Vector2(0, -16)):
		tween_silver = get_tree().create_tween()
		tween_silver.tween_property($Background_1/Silver, "position", Vector2(0, 16), 5).set_trans(Tween.TRANS_QUAD)
		tween_silver.finished.connect(reverseSilverTween)
		tween_silver.play()
		
		if !initGold:
			initGold = true
			tween_gold.play()
	else:
		tween_silver = get_tree().create_tween()
		tween_silver.tween_property($Background_1/Silver, "position", Vector2(0, -16), 5).set_trans(Tween.TRANS_QUAD)
		tween_silver.finished.connect(reverseSilverTween)
		tween_silver.play()
		
func reverseGoldTween():
	if($Background_1/Gold.position == Vector2(0, 16)):
		tween_gold = get_tree().create_tween()
		tween_gold.tween_property($Background_1/Gold, "position", Vector2(0, -16), 4).set_trans(Tween.TRANS_QUAD)
		tween_gold.finished.connect(reverseGoldTween)
		tween_gold.play()
		
		if !initCopper:
			initCopper = true
			tween_copper.play()
	else:
		tween_gold = get_tree().create_tween()
		tween_gold.tween_property($Background_1/Gold, "position", Vector2(0, 16), 4).set_trans(Tween.TRANS_QUAD)
		tween_gold.finished.connect(reverseGoldTween)
		tween_gold.play()
		
func reverseCopperTween():
	if($Background_1/Copper.position == Vector2(0, 16)):
		tween_copper = get_tree().create_tween()
		tween_copper.tween_property($Background_1/Copper, "position", Vector2(0, -16), 6).set_trans(Tween.TRANS_QUAD)
		tween_copper.finished.connect(reverseCopperTween)
		tween_copper.play()
	else:
		tween_copper = get_tree().create_tween()
		tween_copper.tween_property($Background_1/Copper, "position", Vector2(0, 16), 6).set_trans(Tween.TRANS_QUAD)
		tween_copper.finished.connect(reverseCopperTween)
		tween_copper.play()
