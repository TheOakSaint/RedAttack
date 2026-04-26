extends ProgressBar

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")

@onready var text : Label = $HealthBarText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.health.health_changed.connect(_on_health_changed)
	max_value = player.player_stats.current_max_health
	value = player.player_stats.current_health
	
	text.text = str(int(value)) + " / " + str(int(max_value))



func _on_health_changed(_startH, health, maxHealth):
	max_value = maxHealth
	value = health
	text.text = str(int(health)) + " / " + str(int(maxHealth))
	
