extends Area2D

@export var force: float = 1200.0


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.has_method("enter_fan"):
		body.call("enter_fan", self, global_transform.x.normalized() * force)
	


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D and body.has_method("exit_fan"):
		body.call("exit_fan", self)
