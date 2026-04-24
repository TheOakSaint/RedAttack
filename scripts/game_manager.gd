extends Node

@export var game_over_scene: StringName = &""
@export var game_scene: StringName = &""
@export var title_screen_scene: StringName = &""
@onready var player : CharacterBody2D = get_tree().get_first_node_in_group("Player")
@export var pause_menu : Control
var mouse_crosshair : Resource = preload("res://assets/sprites/Crosshair.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(mouse_crosshair, Input.CURSOR_ARROW,Vector2(16,16))
	player.player_died.connect(_on_player_death)
	pause_menu.resume_pressed.connect(_on_pressed_resume)
	pause_menu.restart_pressed.connect(_on_pressed_restart)
	pause_menu.quit_pressed.connect(_on_pressed_quit)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		if not get_tree().paused:
			pause()
		else:
			unpause()

func pause():
	pause_menu.show()
	get_tree().paused = true
	Input.set_custom_mouse_cursor(null)
	

func unpause():
	pause_menu.hide()
	get_tree().paused = false
	Input.set_custom_mouse_cursor(mouse_crosshair, Input.CURSOR_ARROW,Vector2(16,16))
	

func _on_player_death() -> void:
	SceneLoader.load_scene(game_over_scene)

func _on_pressed_resume() -> void:
	unpause()
	
func _on_pressed_restart() -> void:
	
	await SceneLoader.load_scene(game_scene)
	get_tree().paused = false
	
func _on_pressed_quit() -> void:
	await SceneLoader.load_scene(title_screen_scene)
	get_tree().paused = false
