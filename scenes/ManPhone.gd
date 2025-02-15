extends Spatial

#Behaviors
#- If he's standing by the phone, don't pick it up
#- He might just run between doors if they're both open
#- Don't move when he's in the room. 
#
#

export (NodePath) var EntryManagerPath
onready var EntryMananger = get_node(EntryManagerPath)

export var SPEED = 0.3

var currentLocation = 0
var targetLocation = 0

var path = []

onready var Character = $manphone1

signal arrival
signal pathover

func check_entry(id):
	return EntryMananger.is_open(id)
	
func listen():
	pass

func teleport_to(A):
	Character.translation = get_pathnode(A).translation
	currentLocation = A
	targetLocation = A

func run_to(A):
	targetLocation = A
	$manphone1/footsteps.play()
	
func run_between(A, B):
	teleport_to(A)
	run_to(B)
	
func add_to_path(A):
	path.append(A)
	targetLocation = A
	$manphone1/footsteps.play()
	
func get_pathnode(A):
	return $pathNodes.get_child(A)

func _process(delta):
	
	var to_player = get_pathnode(DATA.ENTRY.PLAYER).translation - Character.translation
	Character.rotation.y = atan2(to_player.x, to_player.z)
	
	
	if targetLocation != currentLocation:
		
		var dir = Vector3()
			
		if path.size() == 0:
			dir = (get_pathnode(targetLocation).translation - get_pathnode(currentLocation).translation).normalized()
			
			if Character.translation.distance_to($pathNodes.get_child(targetLocation).translation) < 1:
				currentLocation = targetLocation
				print("here")
				emit_signal("arrival")
				$manphone1/footsteps.stop()
		else:	
			dir = (get_pathnode(path[0]).translation - get_pathnode(currentLocation).translation).normalized()
			
			if Character.translation.distance_to(get_pathnode(path[0]).translation) < 3:
				
				if path[0] == targetLocation:
					currentLocation = targetLocation
					path.clear()
					emit_signal("arrival")
					$manphone1/footsteps.stop()
				else:
					currentLocation = path[0]
				
				path.pop_front() 
				print("pop")
				

		Character.translation += SPEED*dir
		Character.rotation.y = atan2(dir.x, dir.z)
	
	Character.translation.y = -2.85
	
func _ready():
	teleport_to(DATA.ENTRY.HIDDEN)

			
		
	
