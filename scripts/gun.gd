extends Node2D

@export var damage = 1
@export var attack_speed = 1.0
@export var spread = 1.0

@onready var gun_sprite := $Sprite2D
@onready var shoot_pos := $Sprite2D/Muzzle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	look_at(get_global_mouse_position())
	var dir = get_global_mouse_position() - global_position
	
	rotation = dir.angle()
	gun_sprite.scale.y = -1 if dir.x < 0 else 1


func shoot(projectile: PackedScene):
	pass
