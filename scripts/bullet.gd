extends Node2D

@export var speed := 2.0
@export var lifetime := 0.8
@export var damage := 1

var direction := Vector2.ZERO

@onready var timer : Timer = $Timer
@onready var hitbox : Area2D =  $Hitbox
@onready var sprite : Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true
	look_at(position + direction)
	
	timer.connect("timeout", queue_free)
	timer.start(lifetime)
	
	hitbox.connect("body_entered", _on_impact)

func _physics_process(delta: float) -> void:
	position += direction * speed
	
func _on_impact(_body:Node) -> void:
	if _body.is_in_group("damagable"):
		try_damage(_body)
	queue_free()

func try_damage(body):
	var health = body.get_node("HealthComponent")
	health.take_damage(damage)
