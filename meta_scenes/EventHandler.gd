extends Node2D

export (NodePath) var TaskMasterPath
export (NodePath) var PhonePath

onready var TaskMaster = get_node(TaskMasterPath)
onready var Phone = get_node(PhonePath)

export (NodePath) var TerminalPath
onready var Terminal = get_node(TerminalPath)

export (NodePath) var EntryManagerPath
onready var EntryManager = get_node(EntryManagerPath)

export (NodePath) var LightManagerPath
onready var LightManager = get_node(LightManagerPath)

export (NodePath) var  ManphonePath
onready var Manphone = get_node(ManphonePath)


func new_task(id = 0):
	
	var ticket = id #Later, this will be random
	
	var data = DATA.tickets[ticket]
	
	TaskMaster.add_task(data.command, data.args)
	
	Phone.new_voice(data.phoneAudio)
	Phone.ring()
	
func phone_call(id):
	var data = DATA.phoneAudio[id]
	Phone.new_voice(data)
	Phone.ring()
	
	
func computer_error():
	Terminal.start_error()
	
	
func missed_phone_call():
	pass
	
func open_door(id):
	EntryManager.open(id)

func close_door(id):
	EntryManager.close(id)
	
func door(id, state):
	if state:
		open_door(id)
	else:
		close_door(id)

func cut_lights():
	LightManager.off(DATA.ENTRY.DOORLEFT)
	LightManager.off(DATA.ENTRY.DOORRIGHT)
	
func light(id, state):
	if state:
		LightManager.on(id)
	else:
		LightManager.off(id)

func on_trigger_received(triggerName, cmd = ""):	
	if get_child_count() == 0:
		return
	
	if get_child(0).obj_id == "Trigger":
		if get_child(0).trigger == triggerName:
			
			if triggerName == "command":
				if get_child(0).cmd == cmd:
					get_child(0).queue_free()
			else:
				get_child(0).queue_free()
			
			#Processes all events before next trigger
			var nextNode = 1
			while (get_child(nextNode) != null and get_child(nextNode).obj_id == "Event"):
				get_child(nextNode).do_event()
				nextNode += 1
				



#Computer Whack
func _on_computerClick_clicked():
	on_trigger_received("whack")

func trigger_timeout():
	on_trigger_received("delay")


func _on_CommandProcessor_command(cmd):
	on_trigger_received("command", cmd)


func _on_Phone_answer_phone():
	on_trigger_received("answerPhone")
