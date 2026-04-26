class_name HealthComponent
extends Node


signal died
signal health_changed(starting, current, max)

@export var max_health: float = 100
var health: float

func _ready():
	health = max_health

func take_damage(amount: float):
	var startH = health
	health = clampf(health - amount, -1.0,  max_health)
	health_changed.emit(startH, health, max_health)

	if health <= 0:
		died.emit()

func _on_max_health_changed(new_max_health) -> void:
	max_health = new_max_health
