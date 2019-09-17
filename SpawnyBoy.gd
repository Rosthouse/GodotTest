extends Node2D

export var scene_to_spawn: PackedScene

func _ready():
	$Timer.connect("timeout", self, "spawn_scene")

func spawn_scene() -> void:
	var inst: Node = scene_to_spawn.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
	add_child(inst)