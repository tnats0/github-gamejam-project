extends Sprite2D

var speed = 400
var anglular_speed = PI


func _init():
	
	print("Hello")
	
func _process(delta:float):
	
	var direction = 0
	
	if Input.is_action_pressed("turn_right"):
		direction = 1
	elif Input.is_action_pressed("turn_left"):
		direction = -1
		
	rotation += anglular_speed * delta * direction
	


	
