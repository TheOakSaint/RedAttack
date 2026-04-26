extends Node2D

#@export var damage : float = 1.0
#@export_range(0.1, 60) var fire_rate : float = 1.0
var can_fire: bool = true
#@export var spread :float = 1.0

@export var gun_stats: WeaponStats

@export var bullet_stats: BulletStats

@onready var gun_sprite := $Sprite2D
@onready var shoot_pos := $Sprite2D/Muzzle
@onready var timer :Timer = $Timer

var BulletScene : Resource

#enum FireMode {
#	SEMI_AUTO,
#	AUTO,
#	BURST
#}

#@export var gun_mode : FireMode


var time_between = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(_on_end)

func _on_end() -> void:
	can_fire = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	rotate_towards_mouse()
	
	if not can_fire:
		time_between += delta
		can_fire = time_between >= 1.0 / gun_stats.current_fire_rate
	
	if gun_stats.current_fire_mode == gun_stats.FireMode.SEMI_AUTO and Input.is_action_just_pressed("left_click") and can_fire:
		shoot(BulletScene)
		
		can_fire = false
		time_between = 0
		
		
		
	if gun_stats.current_fire_mode == gun_stats.FireMode.AUTO and Input.is_action_pressed("left_click") and can_fire:
		shoot(BulletScene)
		can_fire = false
		time_between = 0

func rotate_towards_mouse() -> void:
	look_at(get_global_mouse_position())
	var dir = get_global_mouse_position() - global_position
	
	rotation = dir.angle()
	gun_sprite.scale.y = -1 if dir.x < 0 else 1

func shoot(projectile: PackedScene):
	pass
