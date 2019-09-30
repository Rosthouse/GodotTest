extends Node2D

export var target_node: NodePath

onready var target: Node2D = get_node(target_node)

func _input(event):
   # Mouse in viewport coordinates
	if event.is_action_released("target_set"):
		print("Mouse Click/Unclick at: ", event.position)
		target.position = event.position