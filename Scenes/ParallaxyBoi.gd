extends Node2D

export var speed: float = 0
onready var pbg: ParallaxBackground = $ParallaxBackground

func _process(delta) -> void:
	var movement: int = int( Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	pbg.scroll_offset += Vector2(movement, 0) * speed * delta
	print("Mov: " + String(pbg.scroll_offset))