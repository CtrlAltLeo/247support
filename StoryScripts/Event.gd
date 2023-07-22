extends Node2D

var obj_id = "Event"

onready var EventManager = get_parent().get_parent().get_parent()

export (int, "phonecall", "task", "error", "light", "door", "manphoneTP", "manphoneRunBetween", "manphoneAddPath", "taskNoCall", "andyLine", "andyStart", "sceneChange") var eventType

export (String) var phonecall_id
export (int) var task_id

export (int, "LEFT", "RIGHT") var side
export (bool) var objectState

export (int) var ManphoneTarget = 0
export (int) var ManphoneCurrentLocation = 0

export (String) var andyLine

export (String) var newscene

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
		8:
			EventManager.new_task(task_id, true)
		9:
			EventManager.add_andy_line(andyLine)
		10:
			EventManager.start_andy()
		11:
			get_tree().change_scene_to(load(newscene))
			
	queue_free()
			

