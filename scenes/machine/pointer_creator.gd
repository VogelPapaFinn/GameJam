extends StaticBody2D

var in_progress = false
var current_material : Raw_material
var pointer = preload("res://scenes/pointer.tscn")


func use(usable: Usable) -> bool:
    if usable is not Raw_material:
        return false

    current_material = usable.material_name
    $timer.start()    
    in_progress = true
    return true


func _on_timer_timeout() -> void:
    in_progress = false
    var new_pointer = pointer.instantiate()
    new_pointer.raw_material = current_material
    new_pointer.position = $Finish_position


func _on_interact_area_entered(area:Area2D) -> void:
    # Display the prompt here
    pass # Replace with function body.
