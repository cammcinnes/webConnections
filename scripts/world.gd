extends Node


@export var enemy_scene: PackedScene

func _ready():
	newGame()
	
func newGame():
	$enemy_timer.start()
	$player.start()
	
func _on_enemy_timer_timeout():
	
	var human = enemy_scene.instantiate()
	
	var enemy_spawn = $enemy_path/enemy_spawn
	
	enemy_spawn.progress_ratio = randf()
	
	human.direction = enemy_spawn.rotation + PI / 2

	human.position = enemy_spawn.position
	
	add_child(human)
