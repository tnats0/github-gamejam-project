extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -400.0

var doubleJumpReady = false

@onready var hareket: AnimatedSprite2D = $Hareket

func disableCamera():

	if $Camera2D.enabled:
		
		$"../Camera2D".enabled = true
		$Camera2D.enabled = false
	
	else:
		
		$"../Camera2D".enabled = false
		$Camera2D.enabled = true
	

func jump():
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		doubleJumpReady = true
		
	elif Input.is_action_just_pressed("ui_accept") and doubleJumpReady:
		velocity.y = JUMP_VELOCITY
		doubleJumpReady = false

	elif is_on_floor():
		doubleJumpReady = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta  
	# Handle jump.
	jump()
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		velocity.x = direction * SPEED
		hareket.flip_h = direction < 0
		hareket.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		hareket.play("Idle")
	move_and_slide()

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("camera"):
		
		disableCamera()	
