extends Seeker

export var t: float = 0

var target_previous_position: Vector2

func _ready() -> void:
	._ready()
	target_previous_position = self.target.position

func get_direction() -> Vector2:
	var direction = self.target.position + self.target_previous_position
	var predicted_target = self.target.position + direction * t
	self.previous_position = self.target.position
	return (predicted_target - self.position).normalized()