extends CharacterBody2D
var direction
var player_chase = false
var player
@export var speed = 150

const UP = Vector2(0, -1)
const DOWN = Vector2(0, 1)
const RIGHT = Vector2(1, 0)
const LEFT = Vector2(-1, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player_chase:
		direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_collide(velocity * delta)
	else:
		updateIdleAnimations()
	updateMoveAnimations()
	
	
func updateMoveAnimations():
	#if direction == UP:
		$human.play("walk_up")
	#elif direction == RIGHT:
		#$human.play("walk_side")
	#elif direction == LEFT:
		#$human.play("walk_side")
		#$human.flip_h = true;
	#elif direction == DOWN:
		#$human.play("walk_down")

func updateIdleAnimations():
	pass


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false;
