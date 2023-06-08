extends Node2D

var taskInstance = load("res://terminal/tasks/task.tscn")

func _ready():
	add_task(0, "jim")
	add_task(1, "bo")

func add_task(cmd_enum, args):
	
	var t = taskInstance.instance()
	
	t._type = cmd_enum
	t.args = args
	
	add_child(t)
	
	print(get_child(0).command)
	
func get_task_by_cmd(task_cmd):
	
	var task_arr = []
	
	for c in get_children():
		if c.command == task_cmd:
			task_arr.append(c)
			
	return task_arr
	
	
	

	
	
	
