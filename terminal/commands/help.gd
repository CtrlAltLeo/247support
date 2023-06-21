extends Node2D


export (NodePath) var TerminalPath
onready var terminal = get_node(TerminalPath)

func effect(args):
	terminal.append_history("HELP PROGRAM", true)
#	terminal.append_history("close door [left/right]", true)
#	terminal.append_history("light [side] [on/off]", true)
#	terminal.append_history("Beware the Manphone", true)
	terminal.append_history("psreset [username]", true)
	terminal.append_history("rmuser [username]", true)
	terminal.append_history("promote [username]", true)
	terminal.append_history("clear", true)
	terminal.append_history("vim?", true)
