extends Sprite

export var speed: float = 1

onready var ray: RayCast2D = $RayCast2D
var dir: int = 1

func _process(delta: float) -> void:
	self.translate(Vector2(speed * delta * dir, 0))
	if !ray.is_colliding():
		self.scale.x *= -1
		dir *= -1