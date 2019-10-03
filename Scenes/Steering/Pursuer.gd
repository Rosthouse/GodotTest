extends Seeker

export(float,0,1) var t: float = 0

var target_previous_position: Vector2

func _ready() -> void:
	._ready()
	self.target_previous_position = self.target.position

func get_direction() -> Vector2:
	var target_dir: Vector2 = (self.target.position - self.target_previous_position).normalized()
	
	var distance: Vector2 = self.target.position - self.position
	
	var predicted_target = self.target.position + target_dir * t * distance.length()
	self.target_previous_position = self.target.position
	
	var predicted_direction: Vector2 = (predicted_target - self.position).normalized()
	return predicted_direction