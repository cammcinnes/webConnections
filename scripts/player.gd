extends CharacterBody2D

var speed = 110
var direction

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const RIGHT = Vector2(1, 0)
const LEFT = Vector2(-1, 0)
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	$spider.play("idle_right")
	position = Vector2(320, 180)
	$web.visible = false
	$web.enabled = false
	start()

# Called when start button is hit
func start():
	self.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	look_at(get_global_mouse_position())
	# Movement
	move_player(delta)
	# Animations
	update_animations()
	
	fire_web()

func move_player(delta):
	var input_direction = Vector2(
	Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	velocity = input_direction.normalized() * speed

	# Update direction based on input
	if input_direction.length_squared() > 0:
		direction = input_direction.normalized()
	
	move_and_collide(velocity * delta)
	
func update_animations():
	pass
	
func fire_web():
	if Input.is_action_pressed("fire_web"):
		$web.visible = true
		$web.enabled = true
	if Input.is_action_just_released("fire_web"):
		$web.visible = false
		$web.enabled = false
