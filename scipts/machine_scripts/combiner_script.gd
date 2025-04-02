extends StaticBody2D

var current_shell: Clock_shell
var current_pointer: Clock_pointer
var current_chain: Clock_chain
var finished_product
var finished_clock  = preload("res://scenes/item/Finished_clock.gd")

func _ready() -> void:
    $Chain_area.machine = self
    $Pointer_area.machine = self
    $Shell_area.machine = self

func use(item: Usable) -> Usable:
    match item:
        Clock_shell:
            if current_shell:
                return item
            current_shell = item
            check_for_full()
            return null
        Clock_pointer:
            if current_pointer:
                return item
            current_pointer = item
            check_for_full()
            return null
        Clock_chain:
            if current_chain:
                return item
            current_chain = item
            check_for_full()
            return null
    return null

func check_for_full():
    if current_chain and current_pointer and current_shell:
        var new_clock = finished_clock.instatiate()
        new_clock.position = $Finished_position.position
        finished_product = new_clock

func pick_up() -> Usable:
    var tmp = finished_product
    finished_product = null
    return tmp
