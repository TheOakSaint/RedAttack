extends CharacterBody2D


@export var player_stats: PlayerStats

#const SPEED = 130.0
signal player_died

@onready var health : Node = $HealthComponent
@onready var sprite : Sprite2D = $Sprite2D
@onready var gun : Node2D = $Pistol
@onready var collider : CollisionShape2D = $CollisionShape2D
@onready var camera : Camera2D = $Camera2D 
var flash_tween: Tween

func flash():
	# Kill any existing flash
	if flash_tween and flash_tween.is_running():
		flash_tween.kill()

	# Reset instantly 
	modulate = Color(1, 1, 1)

	# Create new tween
	flash_tween = create_tween()

	# Flash to red quickly
	flash_tween.tween_property(self, "modulate", Color(1, 0.3, 0.3), 0.05)

	# Fade back to normal
	flash_tween.tween_property(self, "modulate", Color(1, 1, 1), 0.1)


func _ready() -> void:
	health.died.connect(_on_died)
	health.health_changed.connect(_on_health_changed)
	health.health_changed.connect(player_stats._on_health_changed)
	player_stats.max_health_changed.connect(health._on_max_health_changed)
func _physics_process(_delta: float) -> void:
	# Add the gravity.
	

	# Get the input direction and handle the movement/deceleration.
	var directionH := Input.get_axis("action_left", "action_right")
	var directionV := Input.get_axis("action_up", "action_down")
	if directionH:
		velocity.x = directionH * player_stats.current_speed
	else:
		velocity.x = move_toward(velocity.x, 0, player_stats.current_speed)
		
	if directionV:
		velocity.y = directionV * player_stats.current_speed
	else:
		velocity.y = move_toward(velocity.y, 0, player_stats.current_speed)
	
	if velocity.length() > 1:
		velocity = velocity.normalized() * player_stats.current_speed
	
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

func _on_health_changed(startH, current, _max_health):
	if startH - current > 0:
		camera.shake_camera()
		flash()
