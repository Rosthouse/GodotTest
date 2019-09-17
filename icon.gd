extends Sprite

export var speed: int = 1

func _process(delta):
	var left: int = -1 if (Input.is_action_pressed("ui_left")) else 0 
	var right: int = 1 if (Input.is_action_pressed("ui_right")) else 0
	var up: int = -1 if(Input.is_action_pressed("ui_up")) else 0
	var down: int = 1 if(Input.is_action_pressed("ui_down")) else 0
	
	
	self.position += Vector2(left + right, up + down)
