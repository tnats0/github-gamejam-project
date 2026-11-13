extends StaticBody2D

var is_ready = true
var current_angle = 0.0
const ANGLE = 90.0

func _ready() -> void:
	current_angle = snappedf(global_rotation_degrees, ANGLE)
	global_rotation_degrees = current_angle

func _physics_process(_delta: float) -> void:
	if not is_ready:
		return

	var direction = signf(Input.get_axis("turn_left", "turn_right"))
	if direction == 0.0:
		return

	is_ready = false
	var from_angle = current_angle
	current_angle += ANGLE * direction
	
	print("Previous Angle: ",from_angle," Current Angle: ",current_angle," Global Angle: ",global_rotation_degrees)

	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_method(_set_angle,from_angle,current_angle, 0.3)
	await tween.finished
	
	await get_tree().create_timer(0.5).timeout

	is_ready = true

func _set_angle(angle: float) -> void:
	global_rotation_degrees = angle
