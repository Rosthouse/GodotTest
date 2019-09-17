extends Sprite


export var max_velocity:float = 10
export var jump_force:float = 10
export var acceleration: float = 10

var speed:float = 0

var ground: float = self.position.y

func _process(delta):
	speed = min(max_velocity, speed + acceleration * delta)
	self.position.y = min(ground, self.position.y + speed)
	
	if Input.is_action_just_pressed("ui_up") and self.position.y == ground:
		speed = -jump_force