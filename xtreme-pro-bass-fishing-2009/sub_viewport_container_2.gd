extends SubViewportContainer

func _input(event):
	#if event is InputEventMouse or event is InputEventScreenDrag or event is InputEventScreenTouch:
		#return
	$SubViewport2.push_input(event)




func _on_gui_input(event: InputEvent) -> void:
	$SubViewport2.handle_input_locally = true
	
	$SubViewport2.push_input(event)

	# This line is a hack, that needs to be removed after https://github.com/godotengine/godot/pull/77926 gets merged
	$SubViewport2.handle_input_locally = false
