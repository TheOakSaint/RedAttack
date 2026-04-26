extends Stats
class_name PlayerStats

signal max_health_changed
@export var base_speed: float
@export var base_max_health: float
var base_health: float

var current_speed: float
var current_max_health: float : set = _on_max_health_set
var current_health: float



func setup_stats() -> void:
	recalculate_stats()
	base_health = base_max_health
	
	current_speed = base_speed
	current_max_health = base_max_health
	current_health = base_health

func _on_health_changed(_startH, _current, _max_health) -> void:
	current_health = _current

func _on_max_health_set(new_max_health) -> void:
	current_max_health = new_max_health
	max_health_changed.emit(new_max_health)
