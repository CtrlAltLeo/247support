extends Control


var text_queue = []
signal typing_over
var history_lines = 0


func add_line(line):
	text_queue.append(line)


func append_history():
	history_lines += 1
	$History.text += '\n' + $Entry.text
	
	if history_lines > 7:
		var newText = $History.text.split('\n')
		newText.remove(0)
		newText.remove(0)
		$History.text = ""
		for text in newText:
			$History.text += '\n' + text
			


func start_typing():
	if text_queue.size() == 0:
		$EndConvo.start()
		return
	$Entry.text = text_queue[0]
	$Entry.visible_characters = 0
	$canSeeTimer.start()
	text_queue.pop_front()

	

func _on_canSeeTimer_timeout():
	if $Entry.visible_characters > $Entry.text.length():
		append_history()
		$Entry.text = ""
		start_typing()
		return
		
	$Entry.visible_characters += 1
	$canSeeTimer.wait_time = rand_range(0.08, 0.2)
	$keyboardSounds.sound()
	$canSeeTimer.start()



func _on_EndConvo_timeout():
	emit_signal("typing_over")
	$History.text = ""
	$Entry.text = ""
	history_lines = 0
	text_queue.clear()
	

	
