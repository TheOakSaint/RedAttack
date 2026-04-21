extends CharacterBody2D


@export var speed = 50.0
@export var damage = 1
@export var attack_speed = 1.5

@onready var player :CharacterBody2D= get_tree().get_first_node_in_group("Player")
@onready var health : Node = $HealthComponent
@onready var damagetimer : Timer = $DamageTimer

func _ready() -> void:
	health.died.connect(_on_died)
	health.health_changed.connect(_on_health_changed)

func _physics_process(delta: float) -> void:
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if player:
		var direction := (player.global_position - global_position).normalized()
		if direction:
			velocity = direction * speed

	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()
		if body.is_in_group("Player"):
			try_damage(body)

func try_damage(body):
	if damagetimer.is_stopped():
		var Phealth = body.get_node("HealthComponent")
		Phealth.take_damage(damage)
		damagetimer.start(1.0/attack_speed)


func _on_died():
	print("died")

func _on_health_changed(current, maxH):
	print(str(current) + " / " + str(maxH))
