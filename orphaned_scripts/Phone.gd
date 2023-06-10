extends Spatial

var ringing = false
var phone_active = false

signal dropped_call
var rings = 0

func ring():
	ringing = true
	ring_effects()
	
func ring_effects():
	
	if rings > 3:
		ringing = false
		emit_signal("dropped_call")
		return
	
	$phone.play()
	$AnimationPlayer.play("ring")
	rings += 1

func stop_ring():
	
	if not phone_active:
	
		ringing = false
		$phone.stop()
		$AnimationPlayer.play("pickUp")
		$voice.play()
		phone_active = true
		$rering_timer.stop()
	
func pick_up():
	
	if ringing:
		stop_ring()
	else:
		pass

func _on_clickableArea_clicked():
	pick_up()

func new_voice(filepath):
	$voice.stream = load("res://sounds/phoneAudio/"+filepath+".mp3")


func _on_voice_finished():
	$AnimationPlayer.play_backwards("pickUp")
	phone_active = false


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "ring":
		$rering_timer.start()


func _on_rering_timer_timeout():
	ring_effects()
