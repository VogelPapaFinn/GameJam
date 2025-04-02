extends StaticBody2D

var in_progress = false
var current_material 
var chain = preload("res://scenes/item/chain.tscn")
@export var timer_length = 5
var active_chain

func _ready():
	$InteractionArea.machine = self


func use(usable: Usable) -> Usable:
	if active_chain:
		if !usable:
			active_chain.hide()
			var tmp = active_chain
			active_chain = null
			return tmp 
		else:
			return null

	if usable is not Raw_material:
		return usable 

	$AnimatedSprite2D.play("working")
	
	current_material = usable.material_name
	$Timer.wait_time = timer_length
	$Timer.start()    
	$Loading_bar.start_loading_bar(timer_length)
	in_progress = true
	return null 


func _on_timer_timeout() -> void:
	in_progress = false
	
	$AnimatedSprite2D.play("idle")
	
	var new_chain = chain.instantiate()
	add_child(new_chain)
	new_chain.raw_material = current_material
	new_chain.global_position = $Finish_position.global_position
	active_chain = new_chain
	new_chain.set_sprite()

func _on_interact_area_entered(area:Area2D) -> void:
	# Display the prompt here
	pass # Replace with function body.
