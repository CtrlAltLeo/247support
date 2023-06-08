extends Node2D

onready var TaskMaster = get_viewport().get_child(0).get_node("TerminalStack/TaskMaster")

func effect(args):
	
	if args.size() == 1:
		return
	
	var tasks = TaskMaster.get_task_by_cmd(args[0])
	
	for t in tasks:
		if t.args == args[1]:
			t.complete()
			return
	
	#Send terminal insult
