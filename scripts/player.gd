extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -400.0

@export var health = 100
var doubleJumpReady = false
var is_stuck: bool = false
var fan_forces: Dictionary = {}

@onready var hareket: AnimatedSprite2D = $Hareket
@onready var cam: Camera2D = $Camera2D

func stick() -> void:
	is_stuck = true

func enter_fan(fan: Node2D, force: Vector2) -> void:
	fan_forces[fan.get_instance_id()] = force

func exit_fan(fan: Node2D) -> void:
	fan_forces.erase(fan.get_instance_id())

func _ready():
	
	pass
	


func disableCamera():

	if $Camera2D.enabled:
		
		$"../Camera2D".enabled = true
		$Camera2D.enabled = false
	
	else:
		
		$"../Camera2D".enabled = false
		$Camera2D.enabled = true


func jump():
	
	if Input.is_action_just_pressed("ui_accept") and is_stuck:
		is_stuck = false
		velocity.y = JUMP_VELOCITY
		doubleJumpReady = true
	elif Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		doubleJumpReady = true
		
	elif Input.is_action_just_pressed("ui_accept") and doubleJumpReady:
		velocity.y = JUMP_VELOCITY
		doubleJumpReady = false

	elif is_on_floor():
		doubleJumpReady = false

func _physics_process(delta: float) -> void:
	var fan_force := Vector2.ZERO
	for fan_id in fan_forces:
		fan_force += fan_forces[fan_id]

	# Add the gravity.
	if not is_stuck and not is_on_floor():
		velocity += get_gravity() * delta  
	# Handle jump.
	jump()
	if is_stuck:
		velocity = Vector2.ZERO
		hareket.play("Idle")
		return
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		velocity.x = direction * SPEED
		hareket.flip_h = direction < 0
		hareket.play("Walk")
	else:
		if fan_forces.is_empty():
			velocity.x = move_toward(velocity.x, 0, SPEED)
		hareket.play("Idle")
	if not fan_forces.is_empty():
		velocity += fan_force * delta
	move_and_slide()

func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("camera"):
		
		disableCamera()	
