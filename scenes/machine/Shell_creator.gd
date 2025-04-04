extends StaticBody2D

var in_progress = false
var current_material
var shell = preload("res://scenes/shell.tscn")
@export var timer_length = 5
var active_shell

func _ready():
	$InteractionArea.machine = self


func use(usable: Usable) -> Usable:
	if in_progress:
		return usable
	if active_shell:
		if !usable:
			active_shell.hide()
			var tmp = active_shell
			active_shell = null
			return tmp
		else:
			return usable 

	if usable is not Raw_material:
		return usable 

	$AnimatedSprite2D.play("working")
	
	current_material = usable.material_name
	$Timer.wait_time = timer_length
	$Timer.start()    
	in_progress = true
	$Loading_bar.start_loading_bar(timer_length)
	return null 


func _on_timer_timeout() -> void:
	in_progress = false
	$AnimatedSprite2D.play("idle")
	var new_shell = shell.instantiate()
	add_child(new_shell)
	new_shell.raw_material = current_material
	new_shell.global_position = $Finish_position.global_position
	active_shell = new_shell 
	new_shell.set_sprite()

func _on_interact_area_entered(area:Area2D) -> void:
	# Display the prompt here
	pass # Replace with function body.

func _on_oil_btn_pressed():
	timer_length *= 0.75
