extends AnimatableBody2D

func _physics_process(delta: float) -> void:
	
	var direction = 0
	
	if Input.is_action_pressed("turn_left"):
		
		direction = -1
		
	elif Input.is_action_pressed("turn_right"):
		
		direction = 1
		
	rotation += PI * delta * direction
	
