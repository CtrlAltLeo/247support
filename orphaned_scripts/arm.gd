extends Spatial


func hit():
	$AnimationPlayer.stop()
	self.show()
	$AnimationPlayer.play("RESET")
	$smash.play()


func _on_AnimationPlayer_animation_finished(anim_name):
	self.hide()
