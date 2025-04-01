class_name inventory extends Node

var current_item : Usable 

func get_count() -> int:
    if current_item:
        return 0
    else:
        return 1

func get_resource() -> Usable:
    return current_item

func pickup(r : Usable) -> void:
    current_item = r
    current_item = null

func place() -> Resource:
    var tmp = current_item
    current_item = null
    return tmp
    
func get_item() -> Usable:
    return current_item

func set_item(usable : Usable):
    current_item = usable