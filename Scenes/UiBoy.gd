extends Control

onready var close_button: CloseButton = $CloseSceneBoy
onready var reference_rect: ReferenceRect = $ReferenceRect

var SCENE_GROUP: String = "SceneButtons"

var loaded_scene: Node = null

func _ready() -> void:
	close_button.connect("close_loaded_scene", self, "unload_open_scene")
	close_button.toggle()
	parse_scene_dir("res://Scenes")

func _input(event: InputEvent) -> void:
	if event.is_action("ui_end") and !event.is_echo():
		if loaded_scene == null:
			get_tree().quit()
		else:
			unload_open_scene()
		get_tree().set_input_as_handled()

func parse_scene_dir(dir: String) -> void:
	var scene_dir: Directory = Directory.new()
	scene_dir.change_dir(dir)
	scene_dir.list_dir_begin(true)
	var file: String = "start"
	var offset: int = 0
	while file != "":
		file = scene_dir.get_next()
		if !file.ends_with("scn"):
			continue
		create_button(file, offset)
		offset += 30


func create_button(file: String, offset: int) -> void:
	var button: SceneButton = SceneButton.new()
	var path: String = "res://Scenes/" + file
	button.scene_to_load = ResourceLoader.load(path) as PackedScene
	add_child(button)
	button.rect_position += Vector2(reference_rect.rect_position.x, reference_rect.rect_position.y + offset)
	button.connect("load_scene", self, "load_scene")
	
func load_scene(scene: PackedScene) -> void:
	loaded_scene = scene.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
	add_child(loaded_scene)
	close_button.toggle()
	toggle_scene_buttons()
	
func toggle_scene_buttons() -> void:
	var group_members: Array = get_tree().get_nodes_in_group(SCENE_GROUP)
	for item in group_members:
		var button: SceneButton = item as SceneButton
		button.toggle()

func unload_open_scene() -> void:
	loaded_scene.queue_free()
	close_button.toggle()
	toggle_scene_buttons()
	loaded_scene = null