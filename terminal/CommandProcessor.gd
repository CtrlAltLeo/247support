extends Node2D

signal print_terminal(txt, newline)
signal command(cmd)

var commands = []

func _ready():
	
	for child in self.get_children():
		commands.append(child.keyword)
		
	print(commands)

func _on_terminalInput_command(text):
	text = text.to_lower()
	validate_cmd(text)
	
	
func validate_cmd(c):
	
	var keyword = c.split(" ")[0]
	var args = c.split(" ")
	
	if keyword in commands:
		var cmd = get_node(keyword)
		cmd.activate(args)
		print(keyword)
		emit_signal("command", keyword)
		
		
func terminal_print(msg):
	emit_signal("print_terminal", msg, true)

