extends Node

@export var game_over_scene: StringName = &""
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(preload("res://assets/sprites/Crosshair.png"), Input.CURSOR_ARROW,Vector2(30,30))
	player.player_died.connect(_on_player_death)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("escape"):
		get_tree().quit()


func _on_player_death() -> void:
	SceneLoader.load_scene(game_over_scene)
