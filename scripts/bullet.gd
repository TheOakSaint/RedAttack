extends Node2D

#@export var speed :float = 2.0
#@export var lifetime : float = 0.8
#@export var damage : float = 1.0

@export var bullet_stats: BulletStats

var direction := Vector2.ZERO

@onready var timer : Timer = $Timer
@onready var hitbox : Area2D =  $Hitbox
@onready var sprite : Sprite2D = $Sprite2D

var time_from_start = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	top_level = true
	look_at(position + direction)
	
	timer.connect("timeout", _on_timeout)
	timer.start(bullet_stats.current_lifetime)
	
	hitbox.connect("body_entered", _on_impact)

func _process(_delta: float) -> void:
	position += direction * bullet_stats.current_speed


	
func _on_impact(_body:Node) -> void:
	if _body.is_in_group("damagable"):
		try_damage(_body)
	queue_free()

func _on_timeout() -> void:
	queue_free()

func try_damage(body):
	var health = body.get_node("HealthComponent")
	health.take_damage(bullet_stats.current_damage)
	
	
	
