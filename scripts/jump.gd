extends Area2D



@export var height = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	if body is CharacterBody2D:
		
		print(body.velocity.y)
		
		body.velocity.y = -1200.0
		
		print(body.velocity.y)
		
		print("Jump")
			
			
