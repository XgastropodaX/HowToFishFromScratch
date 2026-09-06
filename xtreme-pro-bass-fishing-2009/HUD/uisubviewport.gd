extends SubViewportContainer




func _ready() -> void:
	self.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("tester"):
		print("huh??")
		menuopen = not menuopen
		self.visible = menuopen
