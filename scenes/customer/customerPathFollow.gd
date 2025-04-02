extends PathFollow2D

signal continue_signal

var character: CharacterBody2D
@export var speed = 100  # Movement speed
@export var counter_num = 2
var stopped = false
var leave = false
const last_point = 614
var order_point = 614
var stop_point = 614  # The position where the character stops
var wait_time = 3.0  # Time to wait before continuing
var qid = 0

func init(id: int, _character: CharacterBody2D):
	character = _character
	qid = id
	stop_point = last_point - qid * 64
	if qid < counter_num:
		order_point = stop_point
	
func update_queue():
	qid -= 1
	stop_point = last_point - qid * 64
	if qid < counter_num:
		order_point = stop_point
	stopped = false

func _ready():
	connect("continue_signal", Callable(self, "_on_continue_signal"))

func start_moving():
	set_process(true)  # Enable movement

func _process(delta):
	if not stopped:
		progress += speed * delta  # Continue moving along the path
		if progress >= order_point and not leave:
			stopped = true
			start_timer()
			character.change_state(CustomerState.CUSTOMERSTATE.OREDERING)
		elif progress > stop_point and not leave:
			stopped = true
			character.change_state(CustomerState.CUSTOMERSTATE.WAITING)

func start_timer():
	# Generate order
	var order = GenerateOrder.generate_order()
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true  # Run only once
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	timer.start()

func _on_timer_timeout():
	character.change_state(CustomerState.CUSTOMERSTATE.ANGRYWALKING)
	emit_signal("continue_signal")  # Emit the signal to resume movement

func _on_continue_signal():
	stopped = false  # Allow movement again
	leave = true
	var parent = get_parent()
	parent.on_customer_leave()

func _on_order_received_signal():
	character.change_state(CustomerState.CUSTOMERSTATE.WALKING)
	emit_signal("continue_signal")
