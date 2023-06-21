extends Node2D


func _process(delta):
	
	if Input.is_action_pressed("ESC"):
		
		if $quiteTimer.is_stopped():
			$quiteTimer.start()
			$Label.show()
			
	if Input.is_action_just_released("ESC"):
		$quiteTimer.stop()
		$Label.hide()


func _on_quiteTimer_timeout():
	get_tree().quit()
