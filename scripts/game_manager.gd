extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(preload("res://assets/sprites/Crosshair.png"), Input.CURSOR_ARROW,Vector2(30,30))
	# THIS NEEDS TO BE CHANGED
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("escape"):
		get_tree().quit()
