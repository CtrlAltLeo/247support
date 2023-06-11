extends Node2D

export (NodePath) var TerminalPath
onready var terminal = get_node(TerminalPath)

export (NodePath) var LightManagerPath
onready var LightManager = get_node(LightManagerPath)

func effect(args):
	
	if args.size() < 3:
		terminal.append_history("ERROR!", true)
		terminal.append_history("usage: light [side] [on/off]", true)
		return
	
	var side = -1
	
	if args[1] == "left":
		side = DATA.ENTRY.DOORLEFT
	if args[1] == "right":
		side = DATA.ENTRY.DOORRIGHT
		
	if args[2] == "on":
		LightManager.on(side)
	elif args[2] == "off":
		LightManager.off(side)
	else:
		terminal.append_history("ERROR!", true)
		terminal.append_history("You can't perform that operation on light", true)
