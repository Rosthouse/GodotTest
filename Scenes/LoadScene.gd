extends Button
class_name SceneButton

var SCENE_GROUP: String = "SceneButtons"
export var scene_to_load: PackedScene = null setget set_scene_to_load, get_scene_to_load

signal load_scene(scene_to_load)

func _ready():
	self.connect("button_down", self, "load_scene")
	self.add_to_group(SCENE_GROUP)

func load_scene() -> void:
	emit_signal("load_scene", scene_to_load)
	
func toggle() -> void:
	self.disabled = false if self.disabled else true
	if self.disabled:
		self.hide()
	else:
		self.show()
		
func set_scene_to_load(scene: PackedScene) -> void:
	scene_to_load = scene
	var arr: Array = scene.resource_path.split("/")
	var pLen := len(arr)
	self.text = arr[pLen-1].split(".")[0]
	
func get_scene_to_load() -> PackedScene:
	return scene_to_load