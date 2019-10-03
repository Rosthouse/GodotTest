# Based on: http://www.red3d.com/cwr/steer/gdc99/
extends Sprite
class_name Seeker

export var target_node: NodePath
onready var target: Node2D = get_node(target_node)

export var mass: float = 0
export var max_force: float = 0
export var max_speed: float = 0

export var debug: bool = false

var velocity: Vector2 = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var steering_direction: Vector2 = Vector2(cos(self.rotation), sin(self.rotation))
	
	#var steering_force: Vector2 = steering_direction.clamped(max_force)
	var steering_force: Vector2 = self.get_steering().clamped(max_force)
	var acceleration: Vector2 = steering_force / mass
	
	self.velocity = (velocity + acceleration).clamped(max_speed)
	self.position = self.position + self.velocity
	self.rotation = atan2(steering_direction.y, steering_direction.x)
	update()

func get_direction() -> Vector2:
	return (self.target.position - self.position).normalized()

func get_steering() -> Vector2:
	var desired_velocity: Vector2 =  self.get_direction() * self.max_speed
	return desired_velocity - self.velocity
	
func _draw() -> void:
	if self.debug:
		draw_line(Vector2.ZERO, self.velocity.normalized() * 50, Color.red, 20, true)