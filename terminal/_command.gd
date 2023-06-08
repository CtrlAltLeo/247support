extends Node2D

export var keyword = ""
export var response = ""

func _ready():
	self.name = keyword

func activate(args):
	get_child(0).effect(args)
