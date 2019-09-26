extends Sprite

export var distance_threshold: float = 0
onready var parent: Node2D = get_parent()

func _process(delta: float) -> void:
	var parent_world_pos: Vector2 = parent.global_position
	if parent_world_pos.distance_squared_to(self.global_position) < pow(distance_threshold, 2):
		return
	
	var direction: Vector2 = self.global_position.direction_to(parent_world_pos)
	self.global_position += direction