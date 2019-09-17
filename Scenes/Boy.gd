extends Sprite

export var acceleration: float = 0
export var max_velocity: float = 0
export var friction: float = 0

var current_speed: Vector2 = Vector2.ZERO

func _process(delta):
	
	var input:= Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
						int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up")))
	
	current_speed = Vector2(clamp(current_speed.x + input.x * acceleration * delta, -max_velocity, max_velocity),
							clamp(current_speed.y + input.y * acceleration * delta, -max_velocity, max_velocity))
	self.position += current_speed
	
	current_speed -= current_speed * friction * delta	