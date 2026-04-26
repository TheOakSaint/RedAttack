extends Stats
class_name BulletStats

@export var base_speed :float 
@export var base_lifetime : float 
@export var base_damage : float 

var current_speed :float 
var current_lifetime : float 
var current_damage : float 


func setup_stats() -> void:
	recalculate_stats()
	current_speed = base_speed
	current_lifetime = base_lifetime
	current_damage = base_damage
