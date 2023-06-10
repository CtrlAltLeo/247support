extends Node2D

export (NodePath) var TaskMasterPath
export (NodePath) var PhonePath

onready var TaskMaster = get_node(TaskMasterPath)
onready var Phone = get_node(PhonePath)

export (NodePath) var TerminalPath
onready var Terminal = get_node(TerminalPath)

export (NodePath) var EntryManagerPath
onready var EntryManager = get_node(EntryManagerPath)

func _ready():
	pass
	

func _process(delta):
	pass
	

func new_task():
	
	var ticket = 0
	
	var data = DATA.tickets[ticket]
	
	TaskMaster.add_task(data.command, data.args)
	
	Phone.new_voice(data.phoneAudio)
	Phone.ring()
	
	
func computer_error():
	Terminal.start_error()
	
	
func missed_phone_call():
	pass
	
func open_left_door():
	EntryManager.open(0)
	


	


func _on_Timer_timeout():
	new_task()


func _on_errorTimer_timeout():
	computer_error()
