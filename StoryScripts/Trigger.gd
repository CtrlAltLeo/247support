extends Node2D

var obj_id = "Trigger"

export (String, "whack", "answerPhone", "hangupPhone", "command", "delay", "andyOver", "manphoneArrive") var trigger

export (int) var delay_time

export (String) var cmd
export (String) var arg
	
		
func on_deck():
	if trigger == "delay":
		var t = Timer.new()
		t.wait_time = delay_time
		t.autostart = true
		t.one_shot = true
		t.connect("timeout", t, "queue_free")
		t.connect("timeout", get_parent(), "trigger_timeout")
		self.add_child(t)
		
		

