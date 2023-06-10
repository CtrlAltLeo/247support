extends Spatial


func close(id):
	get_child(id).close()
	
func open(id):
	get_child(id).open()
