class_name inventory extends Node

var current_item : Resource
var inventory_empty : bool 

func _init() -> void:
    inventory_empty = true

func get_count() -> int:
    if inventory_empty:
        return 0
    else:
        return 1

func get_resource() -> Resource:
    return current_item

func pickup(r : Resource) -> void:
    current_item = r
    inventory_empty = false

func place() -> Resource:
    var tmp = current_item
    current_item = null
    inventory_empty = true
    return tmp 