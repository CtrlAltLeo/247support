extends Camera

signal motion

func _ready():
	get_viewport().warp_mouse(Vector2(512,300))


func _input(event):
	
	if event is InputEventMouseMotion:	
		self.rotation_degrees.y -= event.relative.x *.06
		rotation_degrees.y =  clamp(self.rotation_degrees.y, 50, 120 )
		
		if abs(event.relative.x) > 20:
			pass
			#print("MOVED!")

