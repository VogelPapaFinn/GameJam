extends StaticBody2D

var in_progress = false
var current_material
var shell = preload("res://scenes/shell.tscn")
@export var timer_length = 5
var active_shell

func _ready():
	$InteractionArea.machine = self


func use(usable: Usable) -> Usable:
	if active_shell:
		if !usable:
			active_shell.hide()
			var tmp = active_shell
			active_shell = null
			return tmp 
		else:
			return null

	if usable is not Raw_material:
		return usable 

	current_material = usable.material_name
	$Timer.wait_time = timer_length
	$Timer.start()    
	in_progress = true
	return null 


func _on_timer_timeout() -> void:
	in_progress = false
	var new_shell = shell.instantiate()
	add_child(new_shell)
	new_shell.raw_material = current_material
	new_shell.global_position = $Finish_position.global_position
	active_shell = new_shell 
	new_shell.set_sprite()

func _on_interact_area_entered(area:Area2D) -> void:
	# Display the prompt here
	pass # Replace with function body.
