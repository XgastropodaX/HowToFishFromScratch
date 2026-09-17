extends SubViewportContainer

func _input(event):
	#if event is InputEventMouse or event is InputEventScreenDrag or event is InputEventScreenTouch:
		#return
	$SubViewport.push_input(event)




func _on_gui_input(event: InputEvent) -> void:
	$SubViewport.handle_input_locally = true
	
	$SubViewport.push_input(event)
