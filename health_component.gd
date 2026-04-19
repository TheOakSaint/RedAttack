class_name HealthComponent
extends Node


signal died
signal health_changed(current, max)

@export var max_health: int = 100
var health: int

func _ready():
	health = max_health

func take_damage(amount: int):
	health -= amount
	health = max(health, 0)
	health_changed.emit(health, max_health)

	if health == 0:
		died.emit()
