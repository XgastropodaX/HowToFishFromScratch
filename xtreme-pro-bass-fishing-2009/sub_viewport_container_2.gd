extends SubViewportContainer

func _input(event):
	#if event is InputEventMouse or event is InputEventScreenDrag or event is InputEventScreenTouch:
		#return
	$SubViewport2.push_input(event)




func _on_gui_input(event: InputEvent) -> void:
	$SubViewport2.handle_input_locally = true
	
	$SubViewport2.push_input(event)
