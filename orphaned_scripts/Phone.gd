extends Spatial

var ringing = false

func ring():
	ringing = true
	$phone.play()
	$AnimationPlayer.play("ring")

func stop_ring():
	pass
	
func _ready():
	ring()


func _on_clickableArea_clicked():
	pass
