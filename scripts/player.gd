extends CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	$spider.play("idle")
	position = Vector2(320, 180)

# Called when start button is hit
func start():
	self.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	start()
