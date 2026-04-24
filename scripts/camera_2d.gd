extends Camera2D


@export var decay : float = 0.6 # Time it takes to reach 0% of trauma
@export var max_offset : Vector2 = Vector2(100, 75) # Max hor/ver shake in pixels
@export var max_roll : float = 0.1 # Maximum rotation in radians (use sparingly)

var trauma : float = 0.0 # Current shake strength
var trauma_power : int = 1 # Trauma exponent. Increase for more extreme shaking

func _process(delta):
	if trauma: # If the camera is currently shaking
		trauma = max(trauma - decay * delta, 0) # Decay the shake strength
		shake() # Shake the camera


func shake_camera():
	trauma = max(trauma, 0.04)
	
func shake() -> void:
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * randf_range(-1, 1)
	offset.x = max_offset.x * amount * randf_range(-1, 1)
	offset.y = max_offset.y * amount * randf_range(-1, 1)
