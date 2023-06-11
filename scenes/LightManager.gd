extends Spatial


func off(id):
	get_child(id).hide()
	
func on(id):
	get_child(id).show()
