extends "res://scripts/gun.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	BulletScene = preload("res://scenes/bullet.tscn")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	

func shoot(projectile: PackedScene):
	var projectile_instance := projectile.instantiate()
	projectile_instance.bullet_stats = bullet_stats.duplicate()
	projectile_instance.position = shoot_pos.global_position
	projectile_instance.direction = global_position.direction_to(get_global_mouse_position())
	add_child(projectile_instance)
