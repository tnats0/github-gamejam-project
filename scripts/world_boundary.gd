extends Area2D


@onready var player = $"../CharacterBody2D"
@onready var spawnpoint =$"../SpawnRoom/StaticBody2D/Spawnpoint"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	player.global_position = spawnpoint.global_position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
		if body == player:
			
			body.health = 0
			
			print("You Died!")
			
			body.global_position = spawnpoint.global_position
