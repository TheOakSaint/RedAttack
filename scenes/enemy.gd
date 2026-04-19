extends CharacterBody2D


const SPEED = 50.0

@onready var player :CharacterBody2D= $"../Player"
	

func _physics_process(delta: float) -> void:
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if player:
		var direction := (player.global_position - global_position).normalized()
		if direction:
			velocity = direction * SPEED

	move_and_slide()
