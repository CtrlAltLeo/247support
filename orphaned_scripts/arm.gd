extends Spatial


func hit():
	self.show()
	$AnimationPlayer.play("whack")
	$smash.play()
