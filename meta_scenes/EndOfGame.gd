extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AndyText.add_line("Game over")
	$AndyText.add_line("Thank you for playing!")
	$AndyText.add_line("You will now be sent to a form.")
	$AndyText.add_line("I want your feedback to make")
	$AndyText.add_line("this game even better!")
	$AndyText.add_line("Have a nice day!")
	$AndyText.add_line("/(^_^)/")
	
	$AndyText.start_typing()


func _on_AndyText_typing_over():
	OS.shell_open("https://docs.google.com/forms/d/e/1FAIpQLSfdJb8uVvo1IP1V9dBz4gl_qSTiXrVQo9jcPBpPrlwngLgZQg/viewform?usp=sf_link")
	get_tree().quit()
