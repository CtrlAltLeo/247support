extends Node2D

export (NodePath) var TaskMasterPath
export (NodePath) var TerminalPath

onready var TaskMaster = get_node(TaskMasterPath)
onready var terminal = get_node(TerminalPath)

func effect(args):
	
	if args.size() == 1:
		
		if args[0] == "psreset":
			terminal.append_history("ERROR!", true)
			terminal.append_history("Use: psreset [user]", true)
			
		if args[0] == "rmuser":
			terminal.append_history("ERROR!", true)
			terminal.append_history("Use: rmuser [user]", true)
			
		if args[0] == "promote":
			terminal.append_history("ERROR!", true)
			terminal.append_history("Use: promote [user]", true)
		
		return
	
	var tasks = TaskMaster.get_task_by_cmd(args[0])
	
	for t in tasks:
		if t.args == args[1]:
			t.complete()
			terminal.append_history("Operation on "+args[1]+" successful." ,true)
			return
			
	terminal.insult()
	
	#Send terminal insult
