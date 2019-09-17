extends KinematicBody2D


export var velocity: float = 0

func _physics_process(delta: float) -> void:
	var movement := Vector2(int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
							int(Input.is_action_pressed("ui_down"))  - int(Input.is_action_pressed("ui_up"))) * velocity * delta
	move_and_slide(movement)