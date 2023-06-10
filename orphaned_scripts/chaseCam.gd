extends Camera


func _input(event):
	
	if event is InputEventMouseMotion:	
		self.rotation_degrees.y -= event.relative.x *.05
		rotation_degrees.y =  clamp(self.rotation_degrees.y, 50, 120 )
		

