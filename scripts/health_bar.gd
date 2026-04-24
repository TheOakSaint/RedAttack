extends ProgressBar

@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")

@onready var text : Label = $HealthBarText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.health.health_changed.connect(_on_health_changed)
	max_value = player.health.max_health
	value = player.health.health
	text.text = str(player.health.health) + " / " + str(player.health.max_health)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_health_changed(startH, health, maxHealth):
	max_value = maxHealth
	value = health
	text.text = str(health) + " / " + str(maxHealth)
	
