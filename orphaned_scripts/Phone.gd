extends Spatial

var ringing = false

func ring():
	ringing = true
	$phone.play()
	$AnimationPlayer.play("ring")

func stop_ring():
	ringing = false
	$phone.stop()
	$AnimationPlayer.play("RESET")
	$voice.play()
	
func _ready():
	pass

func _on_clickableArea_clicked():
	stop_ring()

func new_voice(filepath):
	$voice.stream = load("res://sounds/phoneAudio/"+filepath+".mp3")
