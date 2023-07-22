extends Node2D

export (int) var startingNode = 0

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

func _ready():
	
	
	get_child(0).get_child(startingNode).on_deck()
	

	
	

func new_task(id = 0, noCall = false):
	
	var ticket = id #Later, this will be random
	
	var data = DATA.tickets[ticket]
	
	TaskMaster.add_task(data.command, data.args)
	
	if noCall == false:
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
		
func add_andy_line(text):
	Terminal.add_andy_line(text)

func start_andy():
	Terminal.andy_start()

func on_trigger_received(triggerName, cmd = []):
	
	print(triggerName)
	
	var SceneCollection = get_child(0)
	
	if SceneCollection.get_child_count() == 0:
		return
	
	if SceneCollection.get_child(0).obj_id == "Trigger":
		if SceneCollection.get_child(0).trigger == triggerName:
			
			var trig = SceneCollection.get_child(0)
			
			if triggerName == "command":
				if trig.cmd == cmd[0]:
					
					if trig.arg == "":
						print("raw cmd")
					else:
						if trig.arg != cmd[cmd.size() - 1]:
							return
				else:
					return
			else:
				pass
			
			
			for Event in SceneCollection.get_child(0).get_children():
				if "obj_id" in Event:
					Event.do_event()
				
			trig.queue_free()
			
			if SceneCollection.get_child_count() > 1:
				SceneCollection.get_child(1).on_deck()
				
		
#Computer Whack
func _on_computerClick_clicked():
	on_trigger_received("whack")

func trigger_timeout():
	on_trigger_received("delay")


func _on_CommandProcessor_command(cmd):
	on_trigger_received("command", cmd)


func _on_Phone_answer_phone():
	on_trigger_received("answerPhone")


func _on_terminalInput_andyover():
	on_trigger_received("andyOver")


func _on_ManPhone_arrival():
	on_trigger_received("manphoneArrive")


func _on_Phone_end_call():
	on_trigger_received("hangupPhone")
