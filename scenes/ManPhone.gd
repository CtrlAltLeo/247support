extends Spatial

#Behaviors
#- If he's standing by the phone, don't pick it up
#- He might just run between doors if they're both open
#-  
#
#



const SPEED = 0.2

var currentLocation = 0
var targetLocation = 0

onready var Character = $MeshInstance

func check_entry(id):
	pass
	
func listen():
	pass

func teleport_to(A):
	Character.translation = get_pathnode(A).translation
	currentLocation = A

func run_to(A):
	targetLocation = A
	
func run_between(A, B):
	teleport_to(A)
	run_to(B)
	
func _ready():
	teleport_to(DATA.ENTRY.DOORLEFT)
	run_to(3)
	
func get_pathnode(A):
	return $pathNodes.get_child(A)

func _process(delta):
	if targetLocation != currentLocation:
		Character.translation += SPEED*($pathNodes.get_child(targetLocation).translation - $pathNodes.get_child(currentLocation).translation).normalized()
		print("ouf")
	
	if Character.translation.distance_to($pathNodes.get_child(targetLocation).translation) < 5:
		currentLocation = targetLocation
		
	
