extends Node


var tickets = [
	
	{"phoneAudio":"dummy",
	"command":0,
	"args":"stink"},
	
	{"phoneAudio":"res://sounds/phoneAudio/call0.mp3",
	"command":2,
	"args":"toenail1234"},
	
	{"phoneAudio":"res://sounds/phoneAudio/call1.mp3",
	"command":0,
	"args":"chiptech"},
	
	{"phoneAudio":"res://sounds/phoneAudio/call1.mp3",
	"command":2,
	"args":"stink"}
	
]

enum ENTRY {DOORLEFT, DOORRIGHT, MIDDLE, DESKFRONT, DESKLEFT, DESKRIGHT, PLAYER, HIDDEN}

var phoneAudio = {
	
	"welcome": "res://sounds/non-task-voices/banana-phone.mp3",
	"night1-1":"res://sounds/non-task-voices/night1-1.mp3",
	"night1-2":"res://sounds/non-task-voices/night1-2.mp3",
	"prank1":"res://sounds/non-task-voices/prank1.mp3",
	"prank2":"res://sounds/non-task-voices/prank2.mp3",
	"breathing":"res://sounds/breathing.mp3"
	
}
