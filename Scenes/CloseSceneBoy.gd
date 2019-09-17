extends Button
class_name CloseButton
signal close_loaded_scene

func _ready() -> void:
	connect("button_down", self, "close_loaded_scene")
	
func close_loaded_scene() -> void:
	emit_signal("close_loaded_scene")
	
func toggle() -> void:
	self.disabled = false if self.disabled else true
	if self.disabled:
		self.hide()
	else:
		self.show()