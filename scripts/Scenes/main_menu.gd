extends Control

@export var initial_scene: StringName = &""
@export var play_button: Button
@export var quit_button: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(_on_play_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)

func _on_play_button_pressed() -> void:
	SceneLoader.load_scene(initial_scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
