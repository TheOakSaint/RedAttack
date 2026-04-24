extends CharacterBody2D


const SPEED = 130.0
signal player_died

@onready var health : Node = $HealthComponent
@onready var sprite : Sprite2D = $Sprite2D
@onready var gun : Node2D = $Pistol
@onready var collider : CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	health.died.connect(_on_died)
	health.health_changed.connect(_on_health_changed)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	

	# Get the input direction and handle the movement/deceleration.
	var directionH := Input.get_axis("action_left", "action_right")
	var directionV := Input.get_axis("action_up", "action_down")
	if directionH:
		velocity.x = directionH * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if directionV:
		velocity.y = directionV * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if velocity.length() > 1:
		velocity = velocity.normalized() * SPEED
	
	move_and_slide()

func _on_died():
	player_died.emit()
	set_process(false)
	set_physics_process(false)
	collider.disabled = true
	sprite.hide()
	gun.set_process(false)
	gun.hide()
	#play_death_animation()

func _on_health_changed(current, max):
	pass
