extends Control

@export var resume_button: Button
@export var restart_button: Button
@export var quit_button: Button

signal resume_pressed
signal restart_pressed
signal quit_pressed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume_button.pressed.connect(_on_press_resume)
	restart_button.pressed.connect(_on_press_restart)
	quit_button.pressed.connect(_on_press_quit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_press_resume() -> void:
	resume_pressed.emit()

func _on_press_restart() -> void:
	restart_pressed.emit()

func _on_press_quit() -> void:
	quit_pressed.emit()
	
