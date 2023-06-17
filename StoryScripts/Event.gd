extends Node2D

var obj_id = "Event"

onready var EventManager = get_parent()

export (int, "phonecall", "task", "error", "light", "door", "manphoneTP", "manphoneRunBetween", "manphoneAddPath") var eventType

export (String) var phonecall_id
export (int) var task_id

export (int, "LEFT", "RIGHT") var side
export (bool) var objectState

export (int) var ManphoneTarget = 0
export (int) var ManphoneCurrentLocation = 0

#Complext shit for manphone

func do_event():
	
	match eventType:
		0:
			EventManager.phone_call(phonecall_id)
		1:
			EventManager.new_task(task_id)
		2:
			EventManager.computer_error()
		3:
			EventManager.light(side, objectState)
		4:
			EventManager.door(side, objectState)
		5:
			EventManager.Manphone.teleport_to(ManphoneTarget)
		6:
			EventManager.Manphone.run_between(ManphoneCurrentLocation, ManphoneTarget)
		7:
			EventManager.Manphone.add_to_path(ManphoneTarget)
			
	queue_free()
			

