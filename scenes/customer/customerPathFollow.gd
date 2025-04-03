extends PathFollow2D

signal continue_signal

@export var speed = 100  # Movement speed
@export var counter_num = 2

var item_sprites : Array[Texture2D]
var cycle_time : float = 1.5
var current_sprite_index : int = 0
var timer_bubble : float = 0.0
var item_sprite : Sprite2D

var character: CharacterBody2D
var timer: Timer
var stopped = false
var leave = false
var ordered = false
const last_point = 700 
var order_point = 614
var stop_point = 614  # The position where the character stops
var wait_time = 30.0  # Time to wait before continuing
var qid = 0
var order: Clock_product

func _ready():
	item_sprite = Sprite2D.new()
	item_sprite.position = character.speech_bubble.position
	item_sprite.z_index = character.speech_bubble.z_index + 2
	item_sprite.scale = character.speech_bubble.scale
	add_child(item_sprite)
	timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	connect("continue_signal", Callable(self, "_on_continue_signal"))

func init(id: int, _character: CharacterBody2D, _wait_time):
	character = _character
	wait_time = _wait_time
	character.speech_bubble_visible(false)
	character.follow_path = self
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

func get_order():
	return order

func start_moving():
	set_process(true)  # Enable movement

func _process(delta):
	if not stopped:
		progress += speed * delta
		if progress >= order_point and not leave:
			stopped = true
			if not ordered:
				start_timer()
				ordered = true
			character.change_state(CustomerState.CUSTOMERSTATE.OREDERING)
			if !item_sprites.is_empty():
				item_sprite.texture = item_sprites[0]
			character.speech_bubble_visible(true)
		elif progress > stop_point and not leave:
			stopped = true
			character.change_state(CustomerState.CUSTOMERSTATE.WAITING)
	else:
		if !item_sprites.is_empty():
			timer_bubble += delta
			if timer_bubble >= cycle_time:
				timer_bubble -= cycle_time
				current_sprite_index = (current_sprite_index + 1) % item_sprites.size()
				item_sprite.texture = item_sprites[current_sprite_index]
		var time_left = timer.time_left
		if time_left > 0:
			if time_left <= wait_time * 0.25:
				character.change_state(CustomerState.CUSTOMERSTATE.ANGRY)
			elif time_left <= wait_time * 0.5:
				character.change_state(CustomerState.CUSTOMERSTATE.IMPATIENT)
			elif time_left <= wait_time - 1.2:
				character.change_state(CustomerState.CUSTOMERSTATE.WAITING)

func start_timer():
	# Generate order
	order = GenerateOrder.generate_order()
	var band_sprite = order.band.get_sprite()
	var shell_sprite = order.shell.get_sprite()
	var pointer_sprite = order.pointer.get_sprite()
	item_sprites.append(band_sprite)
	item_sprites.append(shell_sprite)
	item_sprites.append(pointer_sprite)
	timer.start()

func _on_timer_timeout():
	Scenemanager.star_manager.customer_left_angry()
	character.change_state(CustomerState.CUSTOMERSTATE.ANGRYWALKING)
	emit_signal("continue_signal")  # Emit the signal to resume movement

func _on_continue_signal():
	stopped = false  # Allow movement again
	leave = true
	character.speech_bubble_visible(false)
	item_sprite.visible = false
	var parent = get_parent()
	parent.on_customer_leave()

func order_recieved():
	print("order recieved")
	Scenemanager.star_manager.customer_left_happy(timer.time_left, wait_time)
	character.change_state(CustomerState.CUSTOMERSTATE.WALKING)
	emit_signal("continue_signal")
