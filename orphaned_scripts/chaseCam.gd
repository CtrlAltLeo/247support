extends Camera


func _input(event):
	
	if event is InputEventMouseMotion:	
		self.rotation_degrees.y -= event.relative.x *.1
		rotation_degrees.y =  clamp(self.rotation_degrees.y, 50, 120 )


func _on_clickableArea_clicked():
	pass # Replace with function body.
