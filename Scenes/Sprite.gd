extends Sprite

export var speed: float = 10
export var angle: int = 0

func _ready():
	$VisibilityNotifier2D.connect("screen_exited", self, "exited_screen")
	angle = rand_range(0, 360)

func _process(delta):
	self.position += Vector2(sin(angle), cos(angle)) * speed * delta

func exited_screen() -> void:
	queue_free()