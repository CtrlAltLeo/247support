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


func _ready():
	pass
	

func _process(delta):
	pass
	

func new_task():
	
	var ticket = 0 #Later, this will be random
	
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

func cut_lights():
	LightManager.off(DATA.ENTRY.DOORLEFT)
	LightManager.off(DATA.ENTRY.DOORRIGHT)
	


func _on_Timer_timeout():
	phone_call("welcome")
	open_door(DATA.ENTRY.DOORLEFT)


func _on_errorTimer_timeout():
	computer_error()
	cut_lights()
