extends Spatial


func off(id):
	get_child(id).hide()
	get_child(id).get_child(0).play(0.19)
	
func on(id):
	get_child(id).show()
	get_child(id).get_child(0).play(0.19)
