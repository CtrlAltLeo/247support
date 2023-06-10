extends Area


signal clicked


func _on_clickableArea_input_event(camera, event, position, normal, shape_idx):
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("clicked")
			print(get_parent().name)
