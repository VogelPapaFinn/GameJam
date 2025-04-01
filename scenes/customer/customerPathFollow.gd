extends PathFollow2D

signal continue_signal  # Define a signal for resuming movement

var speed = 100  # Movement speed
var stopped = false
var leave = false
var stop_point = 618  # The position where the character stops
var wait_time = 3.0  # Time to wait before continuing

func _ready():
	connect("continue_signal", Callable(self, "_on_continue_signal"))

func _process(delta):
	if not stopped:
		progress += speed * delta  # Continue moving along the path
		if progress >= stop_point and not leave:
			stopped = true
			start_timer()  # Start the timer when reaching the stop point

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

func _on_order_recieved_signal():
	emit_signal("continue_signal")
