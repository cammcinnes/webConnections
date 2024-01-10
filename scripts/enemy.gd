extends CharacterBody2D
var direction
var player_chase = false
var player
@export var speed = 100

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const RIGHT = Vector2(1, 0)
const LEFT = Vector2(-1, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player_chase:
		direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
	else:
		updateIdleAnimations()
	updateMoveAnimations()
	move_and_slide()
	
	
func updateMoveAnimations():
	$human.play("walk_right")
	if velocity.x != 0:
		$human.flip_h = velocity.x < 0
	
		

func updateIdleAnimations():
	pass


func _on_detection_area_body_entered(body):
	print("entered")
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false;


