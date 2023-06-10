extends Node2D

signal test_task(cmd, args)
signal error

func effect(args):
	
	emit_signal("error")
