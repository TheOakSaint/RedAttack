extends Resource
class_name Stats




var stat_modifiers: Array[StatModifier]


func _init() -> void:
	setup_stats.call_deferred()
	
func setup_stats() -> void:
	recalculate_stats()


func add_modifier(modifier:StatModifier) -> void:
	stat_modifiers.append(modifier)
	recalculate_stats.call_deferred()

func remove_modifier(modifier:StatModifier) -> void:
	stat_modifiers.erase(modifier)
	recalculate_stats.call_deferred()

func recalculate_stats() -> void:
	var stat_multipliers: Dictionary = {}
	var stat_addends: Dictionary = {}
	for modifier in stat_modifiers:
		var stat_name : String = StatModifier.ModifiableStats.keys()[modifier.stat].to_lower()
		match modifier.modifier_type:
			StatModifier.ModifierType.ADD:
				if not stat_addends.has(stat_name):
					stat_addends[stat_name] = 0.0
				stat_addends[stat_name] += modifier.modifier_amount
			StatModifier.ModifierType.MULTIPLY:
				if not stat_multipliers.has(stat_name):
					stat_multipliers[stat_name] = 1.0
				stat_multipliers[stat_name] += modifier.modifier_amount
				
				if stat_multipliers[stat_name] < 0.0:
					stat_multipliers[stat_name] = 0.0
					
	#aply additive modifiers
	for stat_name in stat_addends:
		var cur_property_name: String = str("current_" + stat_name)
		set(cur_property_name, get(cur_property_name) + stat_multipliers[stat_name])
	
	#apply multiplicative modifiers
	for stat_name in stat_multipliers:
		var cur_property_name: String = str("current_" + stat_name)
		set(cur_property_name, get(cur_property_name) * stat_multipliers[stat_name])
