extends TextureButton

@onready var charTimer = $Timer
var active : bool = false

func _on_pressed():
	# Is it already active?
	if active:
		return
	
	# Set visible characters to 0
	$YouFoolMessage.visible_characters = 0
	
	# Then show it
	$YouFoolMessage.visible = true
	$YouFoolMessage/NinePatchRect.set_position(Vector2(-16, -16))
	$YouFoolMessage/NinePatchRect.set_size(Vector2($YouFoolMessage.visible_characters * 2 + 40, 16))
		
	# Setup the show characters Timer
	charTimer.wait_time = 0.025
	charTimer.connect("timeout", timerAction)
	charTimer.disconnect("timeout", reset)
	
	# Then start it
	charTimer.start()
	active = true

func timerAction():
	$YouFoolMessage.visible_characters += 1
	
	# Update bubble size
	$YouFoolMessage/NinePatchRect.set_size(Vector2($YouFoolMessage.visible_characters * 2 + 40, 16))
	
	# Did we show all characters?
	if $YouFoolMessage.visible_characters == $YouFoolMessage.text.length():
		charTimer.wait_time = 1.5
		charTimer.disconnect("timeout", timerAction)
		charTimer.start()
		charTimer.connect("timeout", reset)
	
func reset():
	$YouFoolMessage.visible = false
	$YouFoolMessage.visible_characters = 0
	active = false
