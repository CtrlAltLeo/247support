extends Node2D

var kexsfx = load("res://sounds/keypress.mp3")

func _input(event):
	
	if event is InputEventKey:
		
		if event.is_pressed():
			return
		
		sound()

		return
		
func sound():
		var sound = AudioStreamPlayer.new()
		sound.stream = kexsfx
		sound.play(1.9)
		sound.pitch_scale = rand_range(0.8, 1.2)
		sound.connect("finished", sound, "queue_free")
		add_child(sound)
	
