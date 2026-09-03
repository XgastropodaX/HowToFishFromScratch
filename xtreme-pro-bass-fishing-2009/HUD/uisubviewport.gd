extends SubViewportContainer


var menuopen = false

func _ready() -> void:
	self.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("tester"):
		print("huh??")
		menuopen = not menuopen
		self.visible = menuopen
