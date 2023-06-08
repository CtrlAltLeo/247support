extends Node2D

signal test_task(cmd, args)

func effect(args):
	
	emit_signal("test_task", 1 , "testargs")
