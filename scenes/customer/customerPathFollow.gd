extends PathFollow2D

signal continue_signal

@export var speed = 100  # Movement speed
var stopped = false
var leave = false
var order_point = 614
var stop_point = 614  # The position where the character stops
var wait_time = 3.0  # Time to wait before continuing
var qid = 0

func init(id: int):
	qid = id
	stop_point = order_point - qid * 64
	
func update_queue():
	qid -= 1
	stop_point = order_point - qid * 64
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
			# TODO: Order animation into waiting animation into impatient animation
		if progress >= stop_point and not leave:
			stopped = true
			# TODO: Waiting animation

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
	emit_signal("continue_signal")  # Emit the signal to resume movement

func _on_continue_signal():
	stopped = false  # Allow movement again
	leave = true
	var parent = get_parent()
	parent.on_customer_leave()

func _on_order_received_signal():
	emit_signal("continue_signal")
