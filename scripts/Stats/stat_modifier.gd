extends Resource
class_name StatModifier

enum ModifierCategory {
	WEAPON,
	BULLET,
	PLAYER,
	ENEMY
}


enum ModifiableStats {
	DAMAGE,
	FIRE_RATE,
	SPREAD,
	SPEED,
	LIFETIME,
	HEALTH
}

enum ModifierType {
	MULTIPLY,
	ADD,
	SUBTRACT,
	DIVIDE,
	LIMIT
}

@export var stat: ModifiableStats
@export var modifier_amount: float
@export var modifier_type: ModifierType
@export var modifier_category : ModifierCategory

func _init(_stat: ModifiableStats, _modifier_amount: float,
		_modifier_type: ModifierType, _modifier_category: ModifierCategory) -> void:
	stat = _stat
	modifier_type = _modifier_type
	modifier_amount = _modifier_amount
	modifier_category = _modifier_category
