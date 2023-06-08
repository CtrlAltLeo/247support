extends Node2D


export var command = ""
export var args = ""

var _type = 0

enum task_type {
	PASSWORD,
	REMOVE,
	ACCESS
}

func _ready():
	
	if _type == task_type.PASSWORD:
		command = "psreset"
	if _type == task_type.REMOVE:
		command = "rmvusr"
		
func complete():
	print("You win!")
	queue_free()
	
		
