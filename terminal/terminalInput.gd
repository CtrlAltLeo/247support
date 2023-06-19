extends Control


onready var text_input = $TextEdit
onready var history = $history

signal command(text)
signal andyover

export var can_type = true

var test = ["Sweet","little","bumblee,","I","know","what","you","what","from","me,","do","pa","do","pa","do","da,","daa","do","pa","do","pa","do","da","daa"]
var between_time = [.5,.5,.1,.2, .3, .2, .2 , .4, .4, .2, .2,.2,.2,.2,.3,.5,.2, .2, .2, .2, .2, .3, .4]

var error = false

var insults = ["Nice try, Bozo", "What the heck?", "404: u suck", "ERROR: 1d10t WARNING", "I'd start looking for work.."]

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextEdit.grab_focus()


func _process(delta):
	
	$TextEdit.readonly = !can_type
	
	
	if Input.is_action_just_pressed("Enter"):
		
		if error:
			return
		
		append_history(text_input.text)
		process_command(text_input.text)
		clear_input()


		
func process_command(t):
	
	t = t.split("\n")[0]
	emit_signal("command", t)


func clear_input():
	text_input.text = ""
	
func clear_history():
	history.text = ""

func append_history(t, newline = false):
	
	if can_type == false:
		return
	
	history.text += t
	
	if newline:
		history.text += "\n"
	
	if history.text.count("\n") >= 8:
		
		var split = history.text.split("\n")
		history.text = ""
		
		for s in range(1, split.size()-1):
			history.text +=  split[s] + "\n"

			


func _on_Timer_timeout():
	
	if between_time.size() > 0:
		$Timer.wait_time = between_time[0]
		between_time.remove(0)
	if test.size() > 0:
		append_history(test[0], true)
		test.remove(0)
		$Timer.start()
		return
		
	clear_history()
	
	
func bee():
	$AudioStreamPlayer.play()
	$Timer.start()

func _on_command_effects_bee():
	bee()

func insult():
	var num = randi() % insults.size()
	append_history(insults[num], true)
	
func start_error():
	error = true
	$"BsodJpg-699699462".show()
	$error.play()
	
func stop_error():
	error = false
	$"BsodJpg-699699462".hide()
	clear_history()
	clear_input()
	insult()
	
func no_input():
	can_type = false
	clear_history()
	clear_input()
	
func allow_input():
	can_type = true
	
func add_andy_line(text):
	$AndyText.add_line(text)

func andy_start():
	$AndyText.start_typing()
	no_input()
	

func _on_AndyText_typing_over():
	emit_signal("andyover")
	allow_input()
	start_error()
