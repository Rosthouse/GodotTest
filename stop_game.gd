extends Node

func _process(delta):
	if Input.is_action_pressed("stop_game"):
		get_tree().quit()
