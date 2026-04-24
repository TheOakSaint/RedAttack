extends Control

@export var game_scene: StringName = &""
@export var main_menu_scene: StringName = &""
@export var restart_button: Button
@export var return_mm_button: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart_button.pressed.connect(_on_game_button_pressed)
	return_mm_button.pressed.connect(_on_return_mm_button_pressed)

func _on_game_button_pressed() -> void:
	SceneLoader.load_scene(game_scene)

func _on_return_mm_button_pressed() -> void:
	SceneLoader.load_scene(main_menu_scene)
