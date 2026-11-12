extends Sprite2D

var speed = 400
var angular_speed = PI

func _init() -> void:
	
	print("Hello Godot")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation += angular_speed * delta
