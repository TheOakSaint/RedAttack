extends Stats
class_name WeaponStats

@export var base_spread: float
@export_range(0.1, 60) var base_fire_rate: float



enum FireMode {
	SEMI_AUTO,
	AUTO,
	BURST
}

@export var base_fire_mode : FireMode


var current_spread: float
var current_fire_rate: float
var current_fire_mode : FireMode

	
func setup_stats() -> void:
	recalculate_stats()
	current_spread = base_spread
	current_fire_rate = base_fire_rate
	current_fire_mode = base_fire_mode



func recalculate_stats() -> void:
	super.recalculate_stats()
