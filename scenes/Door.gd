extends Spatial


var open = false

func open():
	$AnimationPlayer.play("open")
	open = true
	$AudioStreamPlayer3D.play()

func close():
	$AnimationPlayer.play("close")
	open = false
	$AudioStreamPlayer3D.play()
	
	
