extends Node2D

export (NodePath) var TerminalPath
onready var terminal = get_node(TerminalPath)

export (NodePath) var EntryManagerPath
onready var EntryManager = get_node(EntryManagerPath)

func effect(args):
	
	print(args)
	
	if args.size() < 3:
		
		terminal.append_history("ERROR!", true)
		terminal.append_history("usage: close [object] [direction]", true)
		return
	
	if args[2] == "left":
		
		terminal.append_history("Closing Left Door", true)
		EntryManager.close(DATA.ENTRY.DOORLEFT)
		
	if args[2] == "right":
		terminal.append_history("Closing Right Door", true)
		EntryManager.close(DATA.ENTRY.DOORRIGHT)
		
	else:
		pass
