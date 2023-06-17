extends Node2D

var taskInstance = load("res://terminal/tasks/task.tscn")


#cmd enums are 0: psword, 1: remove accout 2 access
func add_task(cmd_enum, args):
	
	var t = taskInstance.instance()
	
	t._type = cmd_enum
	t.args = args
	t.connect("complete", self, "task_complete")
	
	add_child(t)
	
	print(get_child(0).command)
	
func get_task_by_cmd(task_cmd):
	
	var task_arr = []
	
	for c in get_children():
		if c.command == task_cmd:
			task_arr.append(c)
			
	return task_arr
	
func task_complete():
	print("nice!")
		
