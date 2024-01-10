extends RayCast2D

@onready var line = get_node("Line2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	target_position = Vector2(1000, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_colliding():
		var cast = to_local(get_collision_point())
		line.points[1].x = cast.x
	
