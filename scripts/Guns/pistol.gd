extends "res://scripts/gun.gd"

const BulletScene := preload("res://scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
	if Input.is_action_just_pressed("left_click"):
		shoot(BulletScene)
	

func shoot(projectile: PackedScene):
	var projectile_instance := projectile.instantiate()
	projectile_instance.position = shoot_pos.global_position
	projectile_instance.direction = global_position.direction_to(get_global_mouse_position())
	add_child(projectile_instance)
