extends Sprite

export (float, 359) var angle_per_second: float = 0 setget set_angle, get_angle
export var target: NodePath

var center: Vector2 = Vector2.ZERO
var radius: float = 0

func set_angle(angle: float) -> void:
	angle_per_second = deg2rad(angle)
	
func get_angle() -> float:
	return rad2deg(angle_per_second)

func _ready() -> void:
	var target_node: Node2D = get_node(self.target) as Node2D
	self.center = target_node.global_position
	self.radius = (center - self.global_position).length()

func _process(delta: float) -> void:
	var angle: float = angle_per_second * delta
	self.position.x = cos(angle) * (self.position.x - self.center.x) - sin(angle) * (self.position.y - self.center.y) + self.center.x
	self.position.y = sin(angle) * (self.position.x - self.center.x) + cos(angle) * (self.position.y - self.center.y) + self.center.y